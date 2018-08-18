//
//  Diffable.swift
//  Diffable
//
//  Created by Roshan Balaji Nindrai Senthilnathan on 8/17/18.
//  Copyright © 2018 Roshan Balaji Nindrai Senthilnathan. All rights reserved.
//

import Foundation

public protocol Diffable: Hashable {
    func identifier() -> Int
}

public extension Diffable {
    func identifier() -> Int {
        return hashValue
    }
}
