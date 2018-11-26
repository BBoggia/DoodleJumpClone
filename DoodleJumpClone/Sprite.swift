//
//  Sprite.swift
//  DoodleJumpClone
//
//  Created by Branson Boggia on 11/26/18.
//  Copyright © 2018 Pinetree Development Studios. All rights reserved.
//

import UIKit

class sprite: NSObject {
    var width = 10
    var height = 10
    
    var x, y: Int!
    var speed: Int!
    
    func jump() {
        
    }
}

class platform: NSObject {
    var width = 40
    var height = 8
    
    var x, y: Int!
    
    override init() {
        super.init()
        x = randomX()
        y = randomY()
    }
    
    func randomX() -> Int {
        var tmp = 0
        
        return tmp
    }
    
    func randomY() -> Int {
        var tmp = 0
        
        return tmp
    }
}
