//
//  BorderedTextField.swift
//  FilingCabinet
//
//  Created by Maksymilian Galas on 23/10/2018.
//  Copyright © 2018 Arcsoft Sp. z o.o. All rights reserved.
//

import UIKit

class BorderedTextField: TextField, BorderableLayout {
    
    // MARK: View - Properties
    
    typealias ViewModelType = BorderedTextFieldViewModel
    
    // MARK: Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let viewModel = self.viewModel as? BorderedTextFieldViewModel else {
            return
        }
        
        if let bordered = viewModel.bordered {
            self.layout(withBordered: bordered)
        }
        else {
            var bordered = Bordered()
            bordered.width = 1.0
            self.layout(withBordered: bordered)
        }
    }
    
}
