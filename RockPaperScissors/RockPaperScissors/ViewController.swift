//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by Austin Froste on 9/8/20.
//  Copyright © 2020 Aussie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var userScore = 0
    var computerScore = 0
    var userPicked = 0
    var computerPicked = 0
    var rpsArray = ["rock", "paper", "scissors"]
    
    @IBOutlet weak var mainTextLabel: UILabel!
    
    @IBOutlet weak var computerPickedRPS: UIImageView!
    @IBOutlet weak var userPickedRPS: UIImageView!
    
    @IBOutlet weak var pickOneOutlet: UILabel!
    @IBOutlet weak var rockOutlet: UIButton!
    @IBOutlet weak var paperOutlet: UIButton!
    @IBOutlet weak var scissorsOutlet: UIButton!
    @IBAction func userPickedRPSButtons(_ sender: UIButton) {
        if sender.tag == 0 {
            userPicked = 0
        }
        if sender.tag == 1 {
            userPicked = 1
        }
        if sender.tag == 2 {
            userPicked = 2
        }
        hideUserRPS()
        getAndShowCompRPS()
        evaluateScoreAndPrintWinner()
        resetButtonOutlet.isHidden = false
    }
    @IBOutlet weak var resetButtonOutlet: UIButton!
    @IBAction func resetButton(_ sender: UIButton) {
        showUserRPS()
        resetButtonOutlet.isHidden = true
        computerPickedRPS.isHidden = true
        userPickedRPS.isHidden = true
        mainTextLabel.text = "Select Rock Paper Scissors \(showScore())"
    }
    
    func showUserRPS() {
        pickOneOutlet.isHidden = false
        rockOutlet.isHidden = false
        paperOutlet.isHidden = false
        scissorsOutlet.isHidden = false
    }
    
    func hideUserRPS() {
        pickOneOutlet.isHidden = true
        rockOutlet.isHidden = true
        paperOutlet.isHidden = true
        scissorsOutlet.isHidden = true
    }
    
    func getAndShowCompRPS() {
        computerPicked = Int.random(in: 0...2)
        computerPickedRPS.isHidden = false
        if computerPicked == 0 {
            computerPickedRPS.image = UIImage(named: "Rock")
        }
        else if computerPicked == 1 {
            computerPickedRPS.image = UIImage(named: "Paper")
        }
        else if computerPicked == 2 {
            computerPickedRPS.image = UIImage(named: "Scissors")
        }
        
        // user RPS
        userPickedRPS.isHidden = false
        if userPicked == 0 {
            userPickedRPS.image = UIImage(named: "Rock")
        }
        else if userPicked == 1 {
            userPickedRPS.image = UIImage(named: "Paper")
        }
        else if userPicked == 2 {
            userPickedRPS.image = UIImage(named: "Scissors")
        }
    }
    
    
    func evaluateScoreAndPrintWinner() {
        if userPicked == 0 && computerPicked == 1 ||
            userPicked == 1 && computerPicked == 2 ||
            userPicked == 2 && computerPicked == 0 {
            computerScore += 1
            mainTextLabel.text = "User picked \(rpsArray[userPicked]). Computer won. \(showScore())"
        }
        else if userPicked == 0 && computerPicked == 2 ||
            userPicked == 1 && computerPicked == 0 ||
            userPicked == 2 && computerPicked == 1 {
            userScore += 1
            mainTextLabel.text = "User picked \(rpsArray[userPicked]). User won. \(showScore())"
        }
        else if userPicked == computerPicked {
            mainTextLabel.text = "User and computer picked \(rpsArray[userPicked]). It's a tie. \(showScore())"
        }
    }
    func showScore() -> String {
        return "\nUser: \(userScore) - Computer: \(computerScore)"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        showUserRPS()
        resetButtonOutlet.isHidden = true
        computerPickedRPS.isHidden = true
        userPickedRPS.isHidden = false
        mainTextLabel.text = "Select Rock Paper Scissors"
    }


}

//MARK: Fixes
// there's a better way to determine a winner
