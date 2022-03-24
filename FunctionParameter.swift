//
//  FunctionParameter.swift
//  FoodWaste
//
//  Created by Ehsan Zilaei on 2022-03-23.
//

import Foundation

enum FunctionParameter: String {
    case delete, sum
    
    var id: Self { self }
    
    var type: FunctionType {
        switch self {
        case .sum, .delete:
            return .functionKey
        }
    }
    
    var image: String {
        switch self {
        case .delete:
            return "arrow.left"
        case .sum:
            return "equal"
        }
    }
}

enum FunctionType {
    case functionKey
    
    var color: String {
        switch self {
        case .functionKey:
            return "ButtonColorGray"
        }
    }
}
