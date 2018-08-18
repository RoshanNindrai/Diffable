//
//  Differ+PassTwo.swift
//  Diffable
//
//  Created by Roshan Balaji Nindrai Senthilnathan on 8/17/18.
//  Copyright © 2018 Roshan Balaji Nindrai Senthilnathan. All rights reserved.
//

import Foundation

extension Differ {
    mutating func passTwo() {
        oldReferences = createSymbolTable(for: old) { index, symbol in
            symbol.oldCount.increment()
            symbol.oldLineNumber.append(index)
        }
    }
}
