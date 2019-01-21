
//
//  Corner+UI.swift
//  FilingCabinet
//
//  Created by Maksymilian Galas on 15/09/2018.
//  Copyright © 2018 Arcsoft Sp. z o.o. All rights reserved.
//

import UIKit

extension Corner {
    
    var maskedCorner: CACornerMask {
        get {
            switch self {
            case .topLeft:
                return .layerMaxXMinYCorner
            case .topRight:
                return .layerMinXMinYCorner
            case .bottomLeft:
                return .layerMaxXMaxYCorner
            case .bottomRight:
                return .layerMinXMaxYCorner
            }
            
        }
    }
    
    var rectCorner: UIRectCorner {
        get {
            switch self {
            case .topLeft:
                return .topRight
            case .topRight:
                return .topLeft
            case .bottomLeft:
                return .bottomRight
            case .bottomRight:
                return .bottomLeft
            }
            
        }
    }
    
}
