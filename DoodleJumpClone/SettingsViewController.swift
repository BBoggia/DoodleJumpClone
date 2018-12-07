//
//  SettingsViewController.swift
//  DoodleJumpClone
//
//  Created by Branson Boggia on 11/26/18.
//  Copyright © 2018 Pinetree Development Studios. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var colorButton: UIButton!
    @IBOutlet weak var difficultyButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var highScoresButton: UIButton!
    @IBOutlet weak var quitButton: UIButton!
    @IBAction func colorChanged(_ sender: UIButton) {
    }
    @IBAction func difficultyChanged(_ sender: UIButton) {
    }
    @IBAction func restartChanged(_ sender: UIButton) {
    }
    @IBAction func highScoresChanged(_ sender: UIButton) {
        highScores.clearHighScores()
    }
    @IBAction func quitFunction(_ sender: UIButton) {
        exit(0)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    



}
