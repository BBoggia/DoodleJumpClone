//
//  Game.swift
//  DoodleJumpClone
//
//  Created by Branson Boggia on 11/26/18.
//  Copyright © 2018 Pinetree Development Studios. All rights reserved.
//

import UIKit

class game: NSObject {
    
    var gameTimer: Timer!
    var score: Int!
    var difficulty: difficulty!
    var gameState: gameState!
    var spriteSpeed = 1
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
