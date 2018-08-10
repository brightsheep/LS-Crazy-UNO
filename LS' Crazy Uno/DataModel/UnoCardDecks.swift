//
//  UnoCardDecks.swift
//  LS' Crazy Uno
//
//  Created by sydney on 2018/7/2.
//  Copyright © 2018年 Sydney Yang. All rights reserved.
//

import Foundation

class UnoCardDecks {
    
    var cardDeck: [UnoCards] = []
    var numberOfCards: Int = 0
    
    init() {
        
    }
    
    //MARK:- Initialization - Generate a full deck
    init(fullDeck: Bool) {
        
        var card: UnoCards
        var penalty: Int = 0
        
        if fullDeck == false {
            return
        }

        let colors = ["blue", "yellow", "red", "green"]
        for color in colors {
            
            // color and number cards  76
            for index in 0...9 {
                card = UnoCards(cardColor: color, number: index)
                self.cardDeck.append(card)
                numberOfCards += 1
                if index > 0 {
                    card = UnoCards(cardColor: color, number: index)
                    self.cardDeck.append(card)
                    numberOfCards += 1
                }
            }
            
            // special color cards 24
            let actions = ["Reverse", "Skip", "Draw"]
            for action in actions {
                if action == "Draw" {
                    penalty = 2
                }
                else {
                    penalty = 0
                }
                for index in 0...1 {
                    card = UnoCards(cardColor: color, penalty: penalty, action: action)
                    self.cardDeck.append(card)
                    numberOfCards += 1
                }
            }
        }
        // wild cards  4 +0, 4 +4,  1 +5, 1 -1,  swapHands
            
        let wildCards = ["wildDraw4", "wildDraw0", "wildDraw5", "wildDraw-1"]
        for wildCard in wildCards {
                
            print(wildCard)
                
            for index in 0...3{
                if wildCard == "wildDraw4" {
                    penalty = 4
                    card = UnoCards(cardColor: "wild", penalty: penalty, action: "Draw")
                    self.cardDeck.append(card)
                    numberOfCards += 1
                } else if wildCard == "wildDraw0" {
                    penalty = 0
                    card = UnoCards(cardColor: "wild", penalty: penalty, action: "Draw")
                    self.cardDeck.append(card)
                    numberOfCards += 1
                }
                
           //     print("index=", index)
            }

            if wildCard == "wildDraw5" {
                penalty = 5
                numberOfCards += 1
                card = UnoCards(cardColor: "wild", penalty: penalty, action: "Draw")
                self.cardDeck.append(card)
            } else if wildCard == "wildDraw-1" {
                penalty = -1
                numberOfCards += 1
                card = UnoCards(cardColor: "wild", penalty: penalty, action: "Draw")
                self.cardDeck.append(card)
            }
    
            print(penalty)
            
        }
        
        // add one more swap hand car
        card = UnoCards(cardColor: "wild", penalty: 0, action: "SwapHands")
        self.cardDeck.append(card)
        numberOfCards += 1

    }
    
    // MARK: Shuffle deck
    
    
    func shuffleDeck() {
        
        var last = numberOfCards - 1
        
        while(last > 0)
        {
            let rand = Int(arc4random_uniform(UInt32(last)))
            
            print("swap \(last) = \(cardDeck[last].imageName) with \(rand) = \(cardDeck[rand].imageName)")
            
            cardDeck.swapAt(last, rand)
   
            last -= 1
        }

    }
//        card = UnoCards(cardColor: "yellow", number: 1)
//        self.cardDeck.append(card)
//        card = UnoCards(cardColor: "wild", penalty: 0, action: "SwapHands")
//        self.cardDeck.append(card)
        
//        print(cardDeck[0].imageName)
//        print(cardDeck[1].imageName)
//          print(numberOfCards)


    //
    
    //MARK: - Remove one card from the deck at cardindex
    func removeOneCard (cardindex : Int) {
        if cardindex >= numberOfCards {
            print ("Cannot remove the card, ERROR INDEX")
        }
        else {
            self.cardDeck.remove(at: cardindex)
        }
    }
    

    //MARK: - add one card to the deck
    func addOneCard (addedCard : UnoCards) {
        print("add one card")
    }
    
}
    
    
    

