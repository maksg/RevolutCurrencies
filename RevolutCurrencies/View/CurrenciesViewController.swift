//
//  CurrenciesViewController.swift
//  RevolutCurrencies
//
//  Created Maksymilian Galas on 20/01/2019.
//  Copyright © 2019 Infinity Pi Ltd. All rights reserved.
//

import UIKit

class CurrenciesViewController: UIViewController, View, UITableViewDataSource, UITableViewDelegate, CurrenciesViewModelDelegate {
    
    // MARK: View - Properties
    
    typealias ViewModelType = CurrenciesViewModel
    var viewModel: CurrenciesViewModel!
    
    // MARK: IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.delegate = self
        self.title = Translation.Currencies.title.localized
        
        self.tableView.register(CurrenciesTableViewCell.self)
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.viewModel.getCurrencies()
    }
    
    // MARK: UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.currencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = self.viewModel.currencyViewModels[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(forClass: CurrenciesTableViewCell.self, for: indexPath)
        cell.viewModel = viewModel
        
        return cell
    }
    
    // MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let topIndexPath = IndexPath(row: 0, section: 0)
        tableView.moveRow(at: indexPath, to: topIndexPath)
        
        let viewModel = self.viewModel.moveViewModel(atRow: indexPath.row, toRow: 0)
        viewModel.becomeFirstResponder()
    }
    
    // MARK: Prepare For Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
    // MARK: CurrenciesViewModelDelegate
    
    func currenciesViewModel(_ viewModel: CurrenciesViewModel, didGetCurrenciesWithError error: Error?) {
        if let error = error {
            self.showAlert(withError: error)
        }
        self.tableView.reloadData()
    }
    
    func currenciesViewModel(_ viewModel: CurrenciesViewModel, cellDidBecomeFirstResponderAtIndex index: Int) {
        
        let indexPath = IndexPath(row: index, section: 0)
        let topIndexPath = IndexPath(row: 0, section: 0)
        self.tableView.moveRow(at: indexPath, to: topIndexPath)
        
        _ = self.viewModel.moveViewModel(atRow: index, toRow: 0)
    }
    
}
