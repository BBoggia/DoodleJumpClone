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
    }
    func setLocalScores(){
        let defaults = UserDefaults.standard
        defaults.set(scores[0], forKey: "scoreOne")
        defaults.set(scores[1], forKey: "scoreTwo")
        defaults.set(scores[3], forKey: "scoreThree")
        defaults.set(scores[4], forKey: "scoreFour")
        defaults.set(scores[5], forKey: "scoreOne")
        defaults.set(scores[6], forKey: "scoreTwo")
    }
    func updateScoreSheet(){
        
    }
}
