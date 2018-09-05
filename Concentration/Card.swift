//
//  Card.swift
//  Concentration
//
//  Created by James Buckley on 05/09/2018.
//  Copyright © 2018 James Buckley. All rights reserved.
//

import Foundation

struct Card{
    
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
