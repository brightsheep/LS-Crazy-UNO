//
//  UnoCards.swift
//  LS' Crazy Uno
//
//  Created by sydney on 2018/6/28.
//  Copyright © 2018年 Sydney Yang. All rights reserved.
//

import Foundation
import UIKit

class UnoCards {
    
    //MARK:- Internal variables
    var name: String = ""
    var color: String = ""
    var number: Int = -1
    var imageName: String = ""
    var penalty: Int = 0
    var changeDirection: Bool = false
    var skip: Bool = false
    var swapHands: Bool = false
    
    //MARK:- Initialization
    init(){
    }
    
    // Initialize color cards with numbers
    init(cardColor: String, number: Int) {
        
        if penalty == 0 {
            self.color = cardColor
            self.number = number
            self.name = cardColor+String(number)
            self.imageName = name+".png"
        }
        
    }
    
    // Initialize all other special cards 
    init(cardColor: String, penalty: Int, action: String) {
        
        if action == "Draw" {
            self.color = cardColor
            self.number = -1
            self.penalty = penalty
            self.name = cardColor+"Draw"+String(penalty)
            self.imageName = name+".png"
            
        }
        
        if action == "Reverse" || action == "Skip" || action == "SwapHands"{
            
            self.color = cardColor
            self.number = -1
            self.penalty = penalty
            self.name = cardColor+action
            self.imageName = name+".png"
            
            if action == "Reverse" {
                changeDirection = true
            } else if action == "Skip" {
                skip = true
            } else {
                swapHands = true
            }
            
        }
    }
    

    
}
