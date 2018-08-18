//
//  Differ+PassThree.swift
//  Diffable
//
//  Created by Roshan Balaji Nindrai Senthilnathan on 8/17/18.
//  Copyright © 2018 Roshan Balaji Nindrai Senthilnathan. All rights reserved.
//

import Foundation

extension Differ {
    
    /// we use observation 1 and process only those lines having NC = OC = 1. Since each represents (we assume) the same unmodified line, for each we replace the symbol table pointers in NA and OA by the number of the line in another file for example,  if NA [i] corresponds to such a line, we look NA [i] up in the symbol table and set NA[i] to OLNO and OA[OLNO] to i. In pass 3 we also "find" unique virtual lines immediately before the first and immedi- ately after the last lines of the files.
    mutating func passThree() {
        for (index, symbol) in newReferences.enumerated() {
            if case let .pointer(symbol) = symbol, symbol.isInBoth {
                guard !symbol.oldLineNumber.isEmpty else {
                    continue
                }
                
                let oldIndex = symbol.oldLineNumber.remove(at: 0)
                newReferences[index]    = .index(oldIndex)
                oldReferences[oldIndex] = .index(index)
            }
        }
    }
}
