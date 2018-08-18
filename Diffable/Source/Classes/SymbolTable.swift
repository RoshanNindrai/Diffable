//
//  SymbolTable.swift
//  Diffable
//
//  Created by Roshan Balaji Nindrai Senthilnathan on 8/17/18.
//  Copyright © 2018 Roshan Balaji Nindrai Senthilnathan. All rights reserved.
//

import Foundation

public typealias SymbolTableReference = [Int: Symbol]
var symbolTable: SymbolTableReference = [:]

public final class Symbol {
    
    enum Count {
        case zero
        case one
        case many
    }
    
    var oldCount: Count = .zero
    var newCount: Count = .zero
    
    var oldLineNumber: [Int] = []
    
}

extension Symbol {
    var isInBoth: Bool {
        return !(oldCount == .zero || newCount == .zero)
    }
}

extension Symbol: CustomStringConvertible {
    public var description: String {
        return "\(oldCount) -> \(newCount)"
    }
}

extension Symbol.Count {
    mutating func increment() {
        switch self {
        case .zero: self = .one
        case .one: self = .many
        default: return
        }
    }
}
