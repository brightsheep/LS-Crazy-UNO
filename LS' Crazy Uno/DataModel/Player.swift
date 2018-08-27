//
//  Player.swift
//  LS' Crazy Uno
//
//  Created by sydney on 2018/7/5.
//  Copyright © 2018年 Sydney Yang. All rights reserved.
//

import Foundation

class Player {
    var cardInHands : UnoCardDecks = UnoCardDecks()
    var playerName : String = ""
    var numberOfCards : Int = 0
    
    
    // initialization
    init() {
        
    }
    
    init(name: String) {
        playerName = name
    }
    
    // Draw a number of cards from a specific card Deck
    
    func DrawCard(cardDeck: UnoCardDecks, numCards : Int) {
        for index in 0...numCards{
            numberOfCards += 1
            var tempCard : UnoCards = UnoCards()
            tempCard = cardDeck.removeOneCard(cardindex: 0)
            cardInHands.addOneCard(addedCard: tempCard)
        }

    }
    
}
