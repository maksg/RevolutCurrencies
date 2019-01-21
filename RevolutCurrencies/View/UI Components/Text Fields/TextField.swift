//
//  TextField.swift
//  FilingCabinet
//
//  Created by Maksymilian Galas on 23/10/2018.
//  Copyright © 2018 Arcsoft Sp. z o.o. All rights reserved.
//

import UIKit

class TextField: UITextField, View, TextFieldViewModelDelegate, UITextFieldDelegate {
    
    // MARK: View - Properties
    
    typealias ViewModelType = TextFieldViewModel
    var viewModel: TextFieldViewModel! {
        didSet {
            self.delegate = self
            self.viewModel.delegate = self
            
            self.setNeedsDisplay()
            if let backgroundColor = self.viewModel.properties.backgroundColor {
                self.backgroundColor = backgroundColor
            }
            if let textColor = self.viewModel.properties.textColor {
                self.textColor = textColor
            }
            if let target = self.viewModel.properties.target, let selector = self.viewModel.properties.selector {
                self.addTarget(target, action: selector, for: .touchUpInside)
            }
            if let font = self.viewModel.properties.font {
                self.font = font
            }
            
            self.text = self.viewModel.properties.text
            self.placeholder = self.viewModel.properties.placeholder
            self.updateEnabledState(withViewModel: self.viewModel)
        }
    }
    
    // MARK: UITextFieldDelegate
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        let padding = UIEdgeInsets(top: 0.0, left: self.viewModel.textLeftMargin, bottom: 0.0, right: self.viewModel.textRightMargin)
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let padding = UIEdgeInsets(top: 0.0, left: self.viewModel.textLeftMargin, bottom: 0.0, right: self.viewModel.textRightMargin)
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        let padding = UIEdgeInsets(top: 0.0, left: self.viewModel.textLeftMargin, bottom: 0.0, right: self.viewModel.textRightMargin)
        return bounds.inset(by: padding)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        self.viewModel.setValue(updatedText)
        
        return false
    }
    
    @discardableResult
    override func becomeFirstResponder() -> Bool {
        self.viewModel.becomeFirstResponder()
        
        return super.becomeFirstResponder()
    }
    
    // MARK: Methods
    
    private func updateEnabledState(withViewModel viewModel: TextFieldViewModel) {
        DispatchQueue.main.async {
            self.isEnabled = viewModel.isEnabled
            self.backgroundColor = (viewModel.isEnabled ? viewModel.properties.backgroundColor : viewModel.properties.disabledColor)
        }
    }
    
    // MARK: TextFieldViewModelDelegate
    
    func textFieldViewModel(_ viewModel: TextFieldViewModel, didChangeIsEnabled isEnabled: Bool) {
        self.updateEnabledState(withViewModel: viewModel)
    }
    
    func textFieldViewModel(_ viewModel: TextFieldViewModel, didChangeValue value: String?) {
        self.text = value
    }
    
    func textFieldViewModelDidBecomeFirstResponder(_ viewModel: TextFieldViewModel) {
    }
    
}
