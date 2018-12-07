//
//  GameViewController.swift
//  DoodleJumpClone
//
//  Created by Branson Boggia on 11/26/18.
//  Copyright © 2018 Pinetree Development Studios. All rights reserved.
//

import UIKit
var Game = game()

class GameViewController: UIViewController {
    
    var player: sprite!
    var platforms: [platform] = []
    
    var gameTimer: Timer?
    var timeSinceStart = 0 {
        didSet {
            print(timeSinceStart)
        }
    }
    var jumpTimer: Timer?
    var jumpCount = 0 {
        didSet {
            //print(jumpCount)
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
        gameTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.timeSinceStart += 1
        }
        fall()
    }
    
    func pause() {
        Game.gameState = .paused
    }
    
    func end() {
        Game.gameState = .stopped
    }
    
    func fall() {
        jumpTimer = Timer.scheduledTimer(withTimeInterval: 0.0018, repeats: true) { _ in
            //print("FALL TIMER")
            self.player.frame = self.player.frame.offsetBy(dx: 0, dy: 1)
            for i in self.platforms {
                if self.player.frame.maxY == i.frame.minY {
                    self.jumpTimer?.invalidate()
                    self.jump()
                }
            }
            if self.player.frame.maxY > self.view.frame.height {
                self.jumpTimer?.invalidate()
                self.jump()
            }
        }
    }
    
    func jump() {
        jumpTimer = Timer.scheduledTimer(withTimeInterval: 0.0018, repeats: true) { _ in
            //print("JUMP TIMER")
            self.player.frame = self.player.frame.offsetBy(dx: 0, dy: -1)
            self.jumpCount += 1
            if self.jumpCount >= 200 {
                self.jumpCount = 0
                self.jumpTimer?.invalidate()
                self.fall()
            }
        }
    }
    
    @objc func leftDown(_ sender: UIButton) {
    
    }
    
    @objc func leftUp(_ sender: UIButton) {
    
    }
    
    @objc func rightDown(_ sender: UIButton) {
    
    }
    
    @objc func rightUp(_ sender: UIButton) {
    
    }
    
    func randX() -> CGFloat {
        var tmp: CGFloat = 0.0
        return tmp
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        gameTimer?.invalidate()
        jumpTimer?.invalidate()
    }
}
