//
//  Differ+PassFour.swift
//  Diffable
//
//  Created by Roshan Nindrai on 8/18/18.
//  Copyright © 2018 Roshan Balaji Nindrai Senthilnathan. All rights reserved.
//

import Foundation

/// An enumeration to specify the direction of the traversal of references.
enum ReferenceWalker {
    
    /// - ascending: Walk the references in ascending order.
    case ascending
    
    /// - descending: Walk the references in decending order.
    case descending
    
    /// The starting value of the walk.
    ///
    /// - Parameter references: The references which are being walked.
    /// - Returns: The start index.
    func start(references: [Reference]) -> Int {
        
        switch self {
        case .ascending:
            return 0
        case .descending:
            return references.count - 1
        }
        
    }
    
    /// The step increase when walking references.
    var step: Int {
        switch self {
        case .ascending:
            return 1
        case .descending:
            return -1
        }
    }
    
    /// Compare the index with the list of indexes to ensure it is valid.
    ///
    /// - Parameters:
    ///   - i: the index to validate
    ///   - references: The array of references, the count of these determines if the traversal is still valid.
    /// - Returns: true if the traversal is still valid.
    func isValid(i: Int, references: [Reference]) -> Bool {
        
        switch self {
        case .ascending:
            return i < references.count - 1
        case .descending:
            return i > 0
        }
        
    }
    
    /// Determine if the index is in range and can be continued.
    ///
    /// - Parameters:
    ///   - i: the index to validate
    ///   - references: The array of references, the count of these determines if the traversal is still valid.
    /// - Returns: true if the index is in range.
    func inRange(i: Int, references: [Reference]) -> Bool {
        
        switch self {
        case .ascending:
            return i + step < references.count
        case .descending:
            return i + step >= 0
        }
        
    }
    
}

extension Differ {
/// Fourth & Fifth pass
///
/// - Parameter direction: The direction to walk, ascending or descending
    mutating func listWalking(direction: ReferenceWalker) {
    
    var i = direction.start(references: newReferences)
    
    while direction.isValid(i: i, references: newReferences) {
        
        if case .index(let j) = newReferences[i], direction.inRange(i: j, references: oldReferences) {
            if case .pointer(let new) = newReferences[i + direction.step], case .pointer(let old) = oldReferences[j + direction.step], new === old {
                newReferences[i + direction.step] = .index(j + direction.step)
                oldReferences[j + direction.step] = .index(i + direction.step)
            }
        }
        
        i += direction.step
        
    }
}
}
