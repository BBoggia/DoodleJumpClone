//
//  Game.swift
//  DoodleJumpClone
//
//  Created by Branson Boggia on 11/26/18.
//  Copyright © 2018 Pinetree Development Studios. All rights reserved.
//

import UIKit

class game: NSObject {
    
    var score = 0
    
    var setDifficulty: difficulty! {
        didSet {
            defaults.set(setDifficulty, forKey: "diff")
        }
    }
    var gameState: gameState! {
        didSet {
            switch gameState {
            case .playing?:
                start()
            case .paused?:
                pause()
            case .stopped?:
                end()
            default:
                end()
            }
        }
    }
    
    let defaults = UserDefaults.standard
    
    override init() {
        super.init()
        if let diff = defaults.value(forKey: "diff") {
            setDifficulty = diff as? difficulty
        } else {
            setDifficulty = .easy
        }
    }
        
        func start() {
            
        }
        
        func pause() {
            
        }
        
        func end() {
            
        }
}

enum difficulty {
    case easy
    case medium
    case hard
}

enum gameState {
    case playing
    case stopped
    case paused
}
