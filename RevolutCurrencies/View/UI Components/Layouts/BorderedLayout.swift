//
//  BorderedLayout.swift
//  FilingCabinet
//
//  Created by Maksymilian Galas on 23/10/2018.
//  Copyright © 2018 Arcsoft Sp. z o.o. All rights reserved.
//

import UIKit

protocol BorderableLayout: Layout {
    func layout(withBordered bordered: Bordered)
}

extension BorderableLayout where Self: UIView {
    
    func layout(withBordered bordered: Bordered) {
        if bordered.side == .all {
            self.layer.masksToBounds = true
            self.layer.borderWidth = CGFloat(bordered.width)
            self.layer.borderColor = bordered.color.cgColor
        }
        else if bordered.side == .bottom {
            self.layer.masksToBounds = false
            self.layer.shadowColor = UIColor.lightGray.cgColor
            self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
            self.layer.shadowOpacity = 2.0
            self.layer.shadowRadius = 0.0
        }
    }
    
}
