//
//  TextFieldProperties.swift
//  FilingCabinet
//
//  Created by Maksymilian Galas on 16/09/2018.
//  Copyright © 2018 Arcsoft Sp. z o.o. All rights reserved.
//

import UIKit

struct TextFieldProperties {
    
    var placeholder: String? = nil
    var text: String? = nil
    var backgroundColor: UIColor? = UIColor.white
    var textColor: UIColor? = UIColor.black
    var target: Any? = nil
    var selector: Selector? = nil
    var font: UIFont? = UIFont.systemFont(ofSize: 14.0)
    var disabledColor: UIColor? = nil
    
}
