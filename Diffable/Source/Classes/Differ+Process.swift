//
//  Differ+Process.swift
//  Diffable
//
//  Created by Roshan Nindrai on 8/18/18.
//  Copyright © 2018 Roshan Balaji Nindrai Senthilnathan. All rights reserved.
//

import Foundation

extension Differ {
    func processDiff() -> [Diff<Element>] {
        
        var steps = [Diff<Element>]()
        var deleteOffsets = Array(repeating: 0, count: old.count)
        var offset = 0
        
        for (index, item) in oldReferences.enumerated() {
            deleteOffsets[index] = offset
            if case .pointer(_) = item {
                steps.append(.delete(index, old[index]))
                offset += 1
            }
        }
        
        offset = 0
        for (index, item) in newReferences.enumerated() {
            switch item {
            case .pointer(_):
                steps.append(.insert(index, new[index]))
                offset += 1
            case .index(let oldIndex):
                if old[oldIndex] != new[index] {
                    steps.append(.update(index, new[index]))
                }
                
                let deleteOffset = deleteOffsets[oldIndex]
                if (oldIndex - deleteOffset + offset) != index {
                    steps.append(.move(oldIndex, index, new[index]))
                }
            }
        }
        return steps
    }
}
