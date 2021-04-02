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
    
    @IBOutlet weak var playerWinsLabel: UILabel!
    
    @IBOutlet weak var cpuWinsLabel: UILabel!
    
    @IBOutlet weak var restartLabel: UIButton!
    
    var leftScore = 0
    var rightScore = 0
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tieLabel.alpha = 0
        playerWinsLabel.alpha = 0
        cpuWinsLabel.alpha = 0
        restartLabel.alpha = 0
        
    }
    
    // MARK: - Methods
    
    @IBAction func dealTapped(_ sender: Any) {
        
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
            
            // update label
            playerWinsLabel.alpha = 1
            restartLabel.alpha = 1
            
            // make deal button invisible
            dealButtonImage.alpha = 0
        }
        else if rightScore == 10 {
            
            // update label
            cpuWinsLabel.alpha = 1
            restartLabel.alpha = 1
            
            // make deal button invisible
            dealButtonImage.alpha = 0

        }
        
    }
    
    @IBAction func restartTapped(_ sender: Any) {
        
        // reset scores
        leftScore = 0
        rightScore = 0
        
        // update score label
        leftScoreLabel.text = String(0)
        rightScoreLabel.text = String(0)
        
        // remove results labels
        restartLabel.alpha = 0
        playerWinsLabel.alpha = 0
        cpuWinsLabel.alpha = 0
        
        // make deal button transparent
        dealButtonImage.alpha = 1
        
    }
    
}

