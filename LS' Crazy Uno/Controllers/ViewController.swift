//
//  ViewController.swift
//  LS' Crazy Uno
//
//  Created by sydney on 2018/6/26.
//  Copyright © 2018年 Sydney Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cardImage: UIImageView!
    
    @IBOutlet weak var Player2CardNumber: UILabel!
    
    @IBOutlet var playerCard: [UIImageView]!
    
    @IBOutlet weak var newGameButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        var card = UnoCards()
        var delay: Double = 0
        
        let cardDeck = UnoCardDecks(fullDeck: true)
        cardDeck.shuffleDeck()
        
        print(cardDeck.numberOfCards)
        
        for index in 0...1 {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                // Put your code which should be executed with a delay here
                card = cardDeck.cardDeck[index]
                self.cardImage.image = UIImage(named: card.imageName)
                print (card.imageName, index)
            })
            delay += 1.0

        }

    }
    
    @IBAction func newGameButtonPressed(_ sender: Any) {
        newGameButton.setTitle("Restart", for: [])
        print("Go flat")
    }
    
    
}



