//
//  ViewController.swift
//  War Game
//
//  Created by Kyle Sherrington on 2021-04-01.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variables and Properties
    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    
    @IBOutlet weak var leftScoreLabel: UILabel!
    @IBOutlet weak var rightScoreLabel: UILabel!
    
    @IBOutlet weak var tieLabel: UILabel!
    @IBOutlet weak var dealButtonImage: UIButton!
        
    @IBOutlet weak var restartLabel: UIButton!
    @IBOutlet weak var rulesLabel: UILabel!
    
    var leftScore = 0
    var rightScore = 0
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayRules()
        
        tieLabel.alpha = 0
        restartLabel.alpha = 0
        
        leftImageView.alpha = 0
        rightImageView.alpha = 0
        
        restartLabel.layer.borderWidth = 2
        restartLabel.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
    }
    
    // MARK: - Methods
    
    @IBAction func dealTapped(_ sender: Any) {
        
        // show left and right cards
        leftImageView.alpha = 1
        rightImageView.alpha = 1
        
        // remove rules label, only for beginning of game
        rulesLabel.alpha = 0
        
        // remove tie label
        tieLabel.alpha = 0
        
        // generate random numbers between 2 - 14 representing cards
        let leftNumber = Int.random(in: 2...14)
        let rightNumber = Int.random(in: 2...14)
        
        // update images
        leftImageView.image = UIImage(named: "card\(leftNumber)")
        rightImageView.image = UIImage(named: "card\(rightNumber)")
        
        
        // update player and CPU scores
        if leftNumber > rightNumber {
            // player wins, increment 1
            leftScore += 1
            
            // update player label
            leftScoreLabel.text = String(leftScore)
        }
        else if leftNumber < rightNumber {
            // CPU wins, increment 1
            rightScore += 1
            
            // update CPU labe
            rightScoreLabel.text = String(rightScore)
        }
        else {
            // tie
            tieLabel.alpha = 1
        }
        
        // MARK: - Final Score
        
        // final score results
        if leftScore == 10 {
            
            showAlert(title: "Congrats!", message: "You have won! Hit RESTART to play again")
            
            // update label
            restartLabel.alpha = 1
            
            // make deal button invisible
            dealButtonImage.alpha = 0
        }
        else if rightScore == 10 {
            
            showAlert(title: "Sorry!", message: "You were beaten by a computer! Hit RESTART to play again")
            
            // update label
            restartLabel.alpha = 1
            
            // make deal button invisible
            dealButtonImage.alpha = 0

        }
    }
    
    @IBAction func restartTapped(_ sender: Any) {
        
        // display rules
        displayRules()
        
        // reset scores
        leftScore = 0
        rightScore = 0
        
        // remove images
        leftImageView.alpha = 0
        rightImageView.alpha = 0
        
        // update score label
        leftScoreLabel.text = String(0)
        rightScoreLabel.text = String(0)
        
        // remove results labels
        restartLabel.alpha = 0
        
        // make deal button transparent
        dealButtonImage.alpha = 1
        
    }
    
    func showAlert(title:String, message:String) {
        
        // create the alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // create alert action
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        // add action button to alert
        alert.addAction(okAction)
        
        // present the alert
        present(alert, animated: true, completion: nil)
    }
    
    func displayRules() {
        
        // show rules label
        rulesLabel.alpha = 1

    }
    
}
