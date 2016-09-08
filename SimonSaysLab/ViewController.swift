//
//  ViewController.swift
//  SimonSaysLab
//
//  Created by James Campagno on 5/31/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayColorView: UIView!
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var winLabel: UILabel!
    
    @IBAction func redButton(sender: AnyObject) {
        buttonsClicked += 1
        simonSaysGame.guessRed()
        print("red")
        gameResult()
    }
 
   
    @IBAction func greenButton(sender: AnyObject) {
        buttonsClicked += 1
        simonSaysGame.guessGreen()
        print("green")
        gameResult()
    }
    
    
    @IBAction func yellowButton(sender: AnyObject) {
        buttonsClicked += 1
        simonSaysGame.guessYellow()
        print("yellow")
        gameResult()
    }
    
    
    @IBAction func blueButton(sender: AnyObject) {
        buttonsClicked += 1
        simonSaysGame.guessBlue()
        print("blue")
        gameResult()
    }
    
    func gameResult (){
        if buttonsClicked == 5 && simonSaysGame.chosenColors == simonSaysGame.patternToMatch {
            winLabel.hidden = false
            winLabel.text = "You win!"
        }
        else if buttonsClicked == 5 && simonSaysGame.chosenColors != simonSaysGame.patternToMatch {
            winLabel.hidden = false
            winLabel.text = "Nope, try again!"
        }
    
        
    }
    
    var simonSaysGame = SimonSays()
    var buttonsClicked = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        winLabel.hidden = true
        
    }
}

// MARK: - SimonSays Game Methods
extension ViewController {
    
    @IBAction func startGameTapped(sender: UIButton) {
        UIView.transitionWithView(startGameButton, duration: 0.9, options: .TransitionFlipFromBottom , animations: {
            self.startGameButton.hidden = true
            }, completion: nil)
        
        displayTheColors()
    }
    
    private func displayTheColors() {
        self.view.userInteractionEnabled = false
        UIView.transitionWithView(displayColorView, duration: 1.5, options: .TransitionCurlUp, animations: {
            self.displayColorView.backgroundColor = self.simonSaysGame.nextColor()?.colorToDisplay
            self.displayColorView.alpha = 0.0
            self.displayColorView.alpha = 1.0
            }, completion: { _ in
                if !self.simonSaysGame.sequenceFinished() {
                    self.displayTheColors()
                } else {
                    self.view.userInteractionEnabled = true
                    print("Pattern to match: \(self.simonSaysGame.patternToMatch)")
                }
        })
    }
    
}
