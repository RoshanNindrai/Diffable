//
//  DiffableTests.swift
//  DiffableTests
//
//  Created by Roshan Balaji Nindrai Senthilnathan on 8/17/18.
//  Copyright © 2018 Roshan Balaji Nindrai Senthilnathan. All rights reserved.
//

import XCTest
@testable import Diffable

extension Int: Diffable {}


class DiffableTests: XCTestCase {
    
    var differ = Differ(old: [0, 1, 2], new: [1, 2, 3])
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
            differ.diff()
            print(differ.newReferences)
    }
}
