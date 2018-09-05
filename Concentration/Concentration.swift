//
//  Concentration.swift
//  Concentration
//
//  Created by James Buckley on 05/09/2018.
//  Copyright © 2018 James Buckley. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
            
        }
        
        //TODO: Shuffle the cards
        
        for index in 0..<cards.count {
            let randomIndex = Int(arc4random_uniform(UInt32(cards.count)))
            let cardTemp = cards[index]
            cards[index] = cards[randomIndex]
            cards[randomIndex] = cardTemp
        }
        
    }
}
