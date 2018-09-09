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
    
    var Player1 = Player(name: "Sydney")   // Self
    var Player2 = Player(name: "Computer")   // Opponent
    
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
        
        print ("number of card in the main deck, \(mainCardDeck.numberOfCards)")
        print("discard deck has", discardCardDeck.numberOfCards)
        
        dealCards ()   // Deal card
        displayCards()

    }
    
    // MARK: Deal card to players
    
    func dealCards() {
        
        // testing if everything is working
        print (Player1.playerName)
        Player1.DrawCard(cardDeck: mainCardDeck, numCards: 7)
        Player2.DrawCard(cardDeck: mainCardDeck, numCards: 7)
        print(mainCardDeck.numberOfCards)
        print(Player1.numberOfCards)
        print(Player2.numberOfCards)
        print(Player1.cardInHands.cardDeck[1].imageName)
    }
    
    func displayCards(){
        for index in 1...Player1.numberOfCards {
            playerCard.image = UIImage(named: Player1.cardInHands.cardDeck[index].imageName)
        }

        
        
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



