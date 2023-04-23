//
//  CircleButtonType.swift
//  Cabify Shop
//
//  Created by iakalann on 20/04/2023.
//

import Foundation

public enum CircleButtonType: String {
    case cart, trash
    
    var iconName: String {
        return self.rawValue
    }
}
