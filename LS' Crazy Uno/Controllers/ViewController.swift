//
//  ViewController.swift
//  LS' Crazy Uno
//
//  Created by sydney on 2018/6/26.
//  Copyright © 2018年 Sydney Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Global variables
    
    var mainCardDeck = UnoCardDecks(fullDeck: true)   // Main card deck where the cards are drawn from
    var discardCardDeck = UnoCardDecks(fullDeck: false) // Discard card deck
    
    var Player1 = Player()   // Self
    var Player2 = Player()   // Opponent
    
    // IBoutlet connections

    // card Image for the face up cards
    @IBOutlet weak var cardImage: UIImageView!
    
    // Display the number of cards for Player2
    @IBOutlet weak var Player2CardNumber: UILabel!
    
    // Array of card images for Player1
    @IBOutlet var playerCard: [UIImageView]!
    
    // IBoutlet for the new game button
    @IBOutlet weak var newGameButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    // MARK: New Game starts
    
    @IBAction func newGameButtonPressed(_ sender: Any) {
        newGameButton.setTitle("Restart", for: [])
        
//        var card = UnoCards()
        
        mainCardDeck.shuffleDeck()   // shuffle cards
        
        print("main deck has ", mainCardDeck.numberOfCards)
        print("discard deck has", discardCardDeck.numberOfCards)
        
        dealCards ()   // Deal card
        
        print("Go flat")
    }
    
    // MARK: Deal card to players
    
    func dealCards() {
        print (Player1.playerName)
        var card = UnoCards()
        card = mainCardDeck.cardDeck[1]
        print (card.color)
        mainCardDeck.removeOneCard(cardindex: 1)
        
        print (card.color)
        
    }
    
}




//  Old code for displaying the card one by one
//        var delay: Double = 0
//        for index in 0...1 {
//
//            DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
//                // Put your code which should be executed with a delay here
//                card = cardDeck.cardDeck[index]
//                self.cardImage.image = UIImage(named: card.imageName)
//                print (card.imageName, index)
//            })
//            delay += 1.0
//
//        }



