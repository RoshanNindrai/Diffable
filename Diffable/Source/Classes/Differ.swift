//
//  Differ.swift
//  Diffable
//
//  Created by Roshan Balaji Nindrai Senthilnathan on 8/17/18.
//  Copyright © 2018 Roshan Balaji Nindrai Senthilnathan. All rights reserved.
//

import Foundation

public struct Differ<Element: Diffable> {
    let old: [Element]
    let new: [Element]
    
    var oldReferences: [Reference] = []
    var newReferences: [Reference] = []
    
    init(old: [Element], new: [Element]) {
        self.old = old
        self.new = new
    }
}

extension Differ {
    mutating func diff() {
        passOne()
        passTwo()
        passThree()
    }
}
