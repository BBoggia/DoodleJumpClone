//
//  HighScoreViewController.swift
//  DoodleJumpClone
//
//  Created by Branson Boggia on 11/26/18.
//  Copyright © 2018 Pinetree Development Studios. All rights reserved.
//

import UIKit
var highScores = HighScores()

class HighScoreViewController: UIViewController {
    @IBOutlet weak var scoreOne: UILabel!
    @IBOutlet weak var scoreTwo: UILabel!
    @IBOutlet weak var scoreThree: UILabel!
    @IBOutlet weak var scoreFour: UILabel!
    @IBOutlet weak var scoreFive: UILabel!
    @IBOutlet weak var scoreSix: UILabel!
    
    func updateHighScores(){
        highScores.pullLocalScores()
        scoreOne.text = "Score: \(highScores.scores[0])"
        scoreTwo.text = "Score: \(highScores.scores[1])"
        scoreThree.text = "Score: \(highScores.scores[2])"
        scoreFour.text = "Score: \(highScores.scores[3])"
        scoreFive.text = "Score: \(highScores.scores[4])"
        scoreSix.text = "Score: \(highScores.scores[5])"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewDidAppear(_ animated: Bool) {
        updateHighScores()
    }


}
