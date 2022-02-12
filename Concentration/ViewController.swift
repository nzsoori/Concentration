//
//  ViewController.swift
//  Concentration
//
//  Created by Suresh Nimmakayala on 12/02/22.
//

import UIKit

class ViewController: UIViewController {
    // property observer didSet
    var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
            
        }
    }
    @IBOutlet weak var flipCountLabel: UILabel!

    @IBOutlet var cardButtons: [UIButton]!
    
    var emojiChoices = ["👻","🎃","👻","🎃"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
       
        if let cardNumber = cardButtons.firstIndex(of: sender){
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        
        print("cardNumber = \(cardNumber)")
        }else{
            print("chosen card was not in cardButtons");
        }
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton){
      
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = UIColor.orange
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor =  UIColor.white
        }
        
    }

}

