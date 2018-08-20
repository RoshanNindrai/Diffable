//
//  Diff.swift
//  Diffable
//
//  Created by Roshan Nindrai on 8/18/18.
//  Copyright © 2018 Roshan Balaji Nindrai Senthilnathan. All rights reserved.
//

import Foundation

enum Diff<Element> {
    case insert(Int, Element)
    case delete(Int, Element)
    case update(Int, Element)
    case move(Int, Int, Element)
}
