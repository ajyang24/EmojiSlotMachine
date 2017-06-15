//
//  ViewController.swift
//  EmojiSlotMachine
//
//  Created by Andrew Yang on 6/14/17.
//  Copyright © 2017 Andrew Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var scoreLabel1: UILabel!
    @IBOutlet weak var scoreLabel2: UILabel!
    @IBOutlet weak var scoreLabel3: UILabel!
    @IBOutlet weak var totalScoreLabel: UILabel!
    
    var emojiArray = ["🛡", "🇿🇦", "😡", "🤡", "🎰", "😜", "🤧", "😿", "🐘", "👮"]
    var score = 0
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        

    }


    @IBAction func spinButton(_ sender: Any)
    {
        //var randomEmoji: UInt32 = 0
        //randomEmoji = arc4random_uniform(UInt32(emojiArray.count))
        var randomEmoji1 = Int(arc4random_uniform(UInt32(emojiArray.count)))
        print(emojiArray[randomEmoji1])
        
        var randomEmoji2 = Int(arc4random_uniform(UInt32(emojiArray.count)))
        print(emojiArray[randomEmoji2])

        var randomEmoji3 = Int(arc4random_uniform(UInt32(emojiArray.count)))
        print(emojiArray[randomEmoji3])

        
        scoreLabel1.text = (emojiArray[randomEmoji1])
        scoreLabel2.text = (emojiArray[randomEmoji2])
        scoreLabel3.text = (emojiArray[randomEmoji3])
        
        if (randomEmoji1 == randomEmoji2) && (randomEmoji2 == randomEmoji3)
        {
            score = score + 100000
            totalScoreLabel.text = String(score)
            whenYouWin(title: "You have 3 matches", message: "You have won the jackpot")

        }
        else if (randomEmoji1 == randomEmoji2) || (randomEmoji1 == randomEmoji3) || (randomEmoji2 == randomEmoji3)
        {
            score = score + 500
            totalScoreLabel.text = String(score)
            whenYouWin(title : "You have two matches!", message : "Nice Job!")

        }
        else if (scoreLabel1.text! == "👮") && (scoreLabel2.text! == "👮") && (scoreLabel3.text! == "👮")
        {
            score = score - score
            totalScoreLabel.text = String(score)
            
            whenYouWin(title : "You have 3 police officers on your tail!", message : "Uh oh! You lost all of your points!")

        }

    }

    func whenYouWin(title : String, message : String) -> (String,String)
    {
        let myAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let dismissButton = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
        myAlert.addAction(dismissButton)
        present(myAlert, animated: true, completion: nil)
        view.backgroundColor = UIColor.red
        return(title, message)
    }
}



