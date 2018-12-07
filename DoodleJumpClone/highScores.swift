//
//  highScores.swift
//  DoodleJumpClone
//
//  Created by Adam Tischler on 12/6/18.
//  Copyright © 2018 Pinetree Development Studios. All rights reserved.
//

import Foundation

class HighScores: NSObject{
    var scores = [0,0,0,0,0,0]
    func changeScores(newScore: Int){
        var i = 0
        pullLocalScores()
        for score in scores{
            if (newScore > score){
                scores[i] = newScore
                break
            }
            i+=1
        }
        setLocalScores()
    }
    func pullLocalScores(){
        let defaults = UserDefaults.standard
        scores[0] = defaults.integer(forKey: "scoreOne")
        scores[1] = defaults.integer(forKey: "scoreTwo")
        scores[2] = defaults.integer(forKey: "scoreThree")
        scores[3] = defaults.integer(forKey: "scoreFour")
        scores[4] = defaults.integer(forKey: "scoreFive")
        scores[5] = defaults.integer(forKey: "scoreSix")
    }
    func setLocalScores(){
        let defaults = UserDefaults.standard
        defaults.set(scores[0], forKey: "scoreOne")
        defaults.set(scores[1], forKey: "scoreTwo")
        defaults.set(scores[3], forKey: "scoreThree")
        defaults.set(scores[4], forKey: "scoreFour")
        defaults.set(scores[5], forKey: "scoreFive")
        defaults.set(scores[6], forKey: "scoreSix")
    }
    func clearHighScores(){
        let defaults = UserDefaults.standard
        defaults.set(0, forKey: "scoreOne")
        defaults.set(0, forKey: "scoreTwo")
        defaults.set(0, forKey: "scoreThree")
        defaults.set(0, forKey: "scoreFour")
        defaults.set(0, forKey: "scoreFive")
        defaults.set(0, forKey: "scoreSix")
    }
}
