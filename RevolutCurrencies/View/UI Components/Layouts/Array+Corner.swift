//
//  Array+Corner.swift
//  FilingCabinet
//
//  Created by Maksymilian Galas on 15/09/2018.
//  Copyright © 2018 Arcsoft Sp. z o.o. All rights reserved.
//

import UIKit

extension Array where Element == Corner {
    
    var maskedCorners: CACornerMask {
        get {
            var corners: CACornerMask = []
            
            self.forEach({ corners.update(with: $0.maskedCorner) })
            
            return corners
        }
    }
    
    var rectCorners: UIRectCorner {
        get {
            var corners: UIRectCorner = []
            
            self.forEach({ corners.update(with: $0.rectCorner) })
            
            return corners
        }
    }
    
}
