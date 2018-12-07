//
//  HighScore.swift
//  DoodleJumpClone
//
//  Created by Adam Tischler on 12/6/18.
//  Copyright © 2018 Pinetree Development Studios. All rights reserved.
//

import Foundation

class HighScore: NSObject{
    
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
    }
    func updateScoreSheet(){
        
    }
}
