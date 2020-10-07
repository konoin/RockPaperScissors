//
//  ViewController.swift
//  RPS
//
//  Created by Никита Полыко on 10/2/20.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var robotButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playButton.isHidden = true
    }
    
    func play(_ sign: Sign) {
        let computerSign = randomSign()
        robotButton.setTitle(computerSign.emoji, for: .normal)
        
        switch sign {
        case .rock:
            rockButton.isHidden = false
            paperButton.isHidden = true
            scissorsButton.isHidden = true
        case .paper:
            rockButton.isHidden = true
            paperButton.isHidden = false
            scissorsButton.isHidden = true
        case .scissors:
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorsButton.isHidden = false
            
        }
        
        playButton.isHidden = false
        
        let result = sign.getResult(for: computerSign)
        
        switch result {
        case .win:
            statusLabel.text = "YOU WIN !"
            self.view.backgroundColor = UIColor.green
        case .lose:
            statusLabel.text = "YOU LOSE !"
            self.view.backgroundColor = UIColor.red
        case .draw:
            statusLabel.text = "It's DRAW !"
            self.view.backgroundColor = UIColor.gray
        case .start:
            reset()
        }
        
    }
    
    func reset () {
        rockButton.isHidden = false
        paperButton.isHidden = false
        scissorsButton.isHidden = false
        playButton.isHidden = true
        self.view.backgroundColor = UIColor.white
        statusLabel.text = "Your choice ?"
    }
    
    
    // MARK: -IBAction
    
    @IBAction func rockButtonPressed(_ sender: Any) {
        play(.rock)
    }
    
    @IBAction func scissorsButtonPressed(_ sender: Any) {
        play(.scissors)
    }
    
    @IBAction func paperButtonPressed(_ sender: Any) {
        play(.paper)
    }
    
    @IBAction func playButtonPressed(_ sender: Any) {
        reset()
    }
    
    
    
}

