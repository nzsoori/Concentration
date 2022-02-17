//
//  ViewController.swift
//  Concentration
//
//  Created by Suresh Nimmakayala on 12/02/22.
//

import UIKit

class ViewController: UIViewController {
    //have to initialize before you use 'lazy'
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    // property observer didSet
    var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
            
        }
    }
    @IBOutlet weak var flipCountLabel: UILabel!

    @IBOutlet var cardButtons: [UIButton]!
    
 
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
       
        if let cardNumber = cardButtons.firstIndex(of: sender){
        // flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        // let the model handle this choose this card
            game.chooseCard(at: cardNumber)
        //view need to update it is out of sync with model
            updateViewFromModel()
        
        print("cardNumber = \(cardNumber)")
        }else{
            print("chosen card was not in cardButtons");
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = UIColor.white
                
            } else {
                
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? UIColor.clear : UIColor.orange
                
            }
        }
        
    }
    var emojiChoices = ["🦅","👻","🤡","🤠","🎃","🙏🏼","🦾","🐧","🦓","🦍"]
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String {
        
        if  emoji[card.identifier] == nil {
            if emojiChoices.count > 0 {
            let randonIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))

            emoji[card.identifier] = emojiChoices.remove(at: randonIndex)
            }
        }
        return emoji[card.identifier] ?? "?"
    }
    
//    func flipCard(withEmoji emoji: String, on button: UIButton){
//
//        if button.currentTitle == emoji {
//            button.setTitle("", for: UIControl.State.normal)
//            button.backgroundColor = UIColor.orange
//        } else {
//            button.setTitle(emoji, for: UIControl.State.normal)
//            button.backgroundColor =  UIColor.white
//        }
//
//    }

}

