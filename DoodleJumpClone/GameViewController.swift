//
//  GameViewController.swift
//  DoodleJumpClone
//
//  Created by Branson Boggia on 11/26/18.
//  Copyright © 2018 Pinetree Development Studios. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var Game = game()
    var player: sprite!
    var platforms: [platform] = []
    
    var gameTimer: Timer!
    var timeSinceStart = 0 {
        didSet {
            print(timeSinceStart)
        }
    }
    var jumpTimer: Timer!
    var jumpCount = 0 {
        didSet {
            print(jumpCount)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        player = sprite(frame: CGRect(x: self.view.frame.width/2, y: self.view.frame.height * (2/5), width: 40, height: 40))
        platforms.append(platform(frame: CGRect(x: self.view.frame.width/2, y: self.view.frame.height * (2/5) + 80, width: 105, height: 8)))
        view.addSubview(platforms[0])
        view.addSubview(player)
        start()
    }
    
    func start() {
        Game.gameState = .playing
        gameTimer = Timer(timeInterval: 1, repeats: true, block: { (_) in
            self.timeSinceStart += 1
        })
        jumpDown()
    }
    
    func pause() {
        Game.gameState = .paused
    }
    
    func end() {
        Game.gameState = .stopped
    }
    
    func jumpUp() {
        print("JUMP UP START")
        jumpTimer = Timer(timeInterval: 0.2, repeats: true, block: { (_) in
            self.player.frame.offsetBy(dx: 0, dy: -2)
            self.jumpCount += 2
            if self.jumpCount == 80 {
                self.jumpTimer.invalidate()
                self.jumpDown()
            }
            print("JUMP UP END")
        })
    }
    
    func jumpDown() {
        print("JUMP DOWN START")
        jumpTimer = Timer(timeInterval: 0.2, repeats: true, block: { (_) in
            self.player.frame.offsetBy(dx: 0, dy: 2)
            self.jumpCount -= 2
            for i in self.platforms {
                if self.player.frame.maxY == i.frame.minY {
                    self.jumpTimer.invalidate()
                    self.jumpUp()
                }
            }
            if self.player.frame.maxY > self.view.frame.height {
                self.jumpUp()
            }
            print("JUMP DOWN END")
        })
    }
    
    func randX() -> CGFloat {
        var tmp: CGFloat = 0.0
        return tmp
    }
}
