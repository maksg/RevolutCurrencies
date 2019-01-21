//
//  CurrenciesTableViewCell.swift
//  RevolutCurrencies
//
//  Created by Maksymilian Galas on 20/01/2019.
//  Copyright © 2019 Infinity Pi Ltd. All rights reserved.
//

import UIKit

class CurrenciesTableViewCell: UITableViewCell, View, CurrenciesCellViewModelDelegate {
    
    // MARK: View - Properties
    
    typealias ViewModelType = CurrenciesCellViewModel
    var viewModel: CurrenciesCellViewModel! {
        didSet {
            self.viewModel.delegate = self
            self.currencyLabel.text = self.viewModel.name
            self.valueTextField.viewModel = self.viewModel.valueTextFieldViewModel
        }
    }

    // MARK: IBOutlets
    
    @IBOutlet private weak var currencyLabel: UILabel!
    @IBOutlet private weak var valueTextField: BorderedTextField!
    
    // MARK: UINib
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: CurrenciesCellViewModelDelegate
    
    func currenciesCellViewModelBecomeFirstResponder(_ viewModel: CurrenciesCellViewModel) {
        self.valueTextField.becomeFirstResponder()
    }
    
}
