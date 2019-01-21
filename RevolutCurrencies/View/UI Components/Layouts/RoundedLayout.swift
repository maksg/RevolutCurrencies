//
//  RoundedLayout.swift
//  FilingCabinet
//
//  Created by Maksymilian Galas on 15/09/2018.
//  Copyright © 2018 Arcsoft Sp. z o.o. All rights reserved.
//

import UIKit

protocol RoundableLayout: Layout {
    func layout(withRounded rounded: Rounded)
}

extension RoundableLayout where Self: UIView {
    
    func layout(withRounded rounded: Rounded) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = CGFloat(rounded.radius)
        self.layer.maskedCorners = rounded.maskedCorners.maskedCorners
    }
    
}
