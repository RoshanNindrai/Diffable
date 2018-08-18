//
//  Differ+PassOne.swift
//  Diffable
//
//  Created by Roshan Balaji Nindrai Senthilnathan on 8/17/18.
//  Copyright © 2018 Roshan Balaji Nindrai Senthilnathan. All rights reserved.
//

import Foundation

extension Differ {
    mutating func passOne() {
        newReferences = createSymbolTable(for: new) { _, symbol in
            symbol.newCount.increment()
        }
    }
}

extension Differ {
    func createSymbolTable(for elements: [Element],
                           transform: (Int, Symbol) -> Void) -> [Reference] {
        
        var references = [Reference]()
        
        // TODO: use swifts unsafe pointers for speed
        for (index, element) in elements.enumerated() {
            let identifier = element.identifier()
            let entry = symbolTable[element.identifier()] ?? Symbol()
            symbolTable[identifier] = entry
            transform(index, entry)
            references.append(.pointer(entry))
        }
        
        return references
    }
}
