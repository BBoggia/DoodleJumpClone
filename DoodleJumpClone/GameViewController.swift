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
    var platformsStart: [platform] = []
    
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
    var LRTimer: Timer?
    var platformTimer: Timer?
    var platformMoveTimer: Timer?
    
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player = sprite(frame: CGRect(x: self.view.frame.width/2, y: self.view.frame.height * (6/10), width: 40, height: 40))
        platformsStart.append(platform(frame: CGRect(x: randX(), y: self.view.frame.height * (6/10) + 80, width: 105, height: 8)))
        platformsStart.append(platform(frame: CGRect(x: randX(), y: self.view.frame.height * (5/10) + 80, width: 105, height: 8)))
        platformsStart.append(platform(frame: CGRect(x: randX(), y: self.view.frame.height * (4/10) + 80, width: 105, height: 8)))
        platformsStart.append(platform(frame: CGRect(x: randX(), y: self.view.frame.height * (3/10) + 80, width: 105, height: 8)))
        platformsStart.append(platform(frame: CGRect(x: randX(), y: self.view.frame.height * (2/10) + 80, width: 105, height: 8)))
        platformsStart.append(platform(frame: CGRect(x: randX(), y: self.view.frame.height * (1/10) + 80, width: 105, height: 8)))
        platformsStart.append(platform(frame: CGRect(x: randX(), y: 80, width: 105, height: 8)))
        
        for i in 0...platformsStart.count - 1 {
            view.addSubview(platformsStart[i])
        }
        view.addSubview(player)
        view.bringSubviewToFront(leftButton)
        view.bringSubviewToFront(rightButton)
        
        start()
        createPlatforms()
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
                if self.player.frame.maxY > i.frame.minY && self.player.frame.maxY < i.frame.maxY && !(self.player.frame.maxX < i.frame.minX) && !(self.player.frame.minX > i.frame.maxX) {
                    self.jumpTimer?.invalidate()
                    self.jump()
                    return
                }
            }
            if self.player.frame.maxY > self.view.frame.height {
                self.jumpTimer?.invalidate()
                self.jump()
                return
            }
        }
    }
    
    func jump() {
        jumpTimer = Timer.scheduledTimer(withTimeInterval: 0.0018, repeats: true) { _ in
            //print("JUMP TIMER")
            self.player.frame = self.player.frame.offsetBy(dx: 0, dy: -1)
            for i in self.platforms {
                if self.player.frame.maxY > i.frame.minY && self.player.frame.maxY < i.frame.maxY && !(self.player.frame.maxX < i.frame.minX) && !(self.player.frame.minX > i.frame.maxX) {
                    self.jumpTimer?.invalidate()
                    self.jump()
                    return
                }
            }
            self.jumpCount += 1
            if self.jumpCount >= 250 {
                self.jumpCount = 0
                self.jumpTimer?.invalidate()
                self.fall()
                return
            }
        }
    }
    
    @IBAction func leftDown(_ sender: UIButton) {
        self.player.frame = self.player.frame.offsetBy(dx: -20, dy: 0)
    }
    
    @IBAction func rightDown(_ sender: UIButton) {
            self.player.frame = self.player.frame.offsetBy(dx: 20, dy: 0)
    }
    
    func createPlatforms() {
        platformTimer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
            self.platforms.insert(platform(frame: CGRect(x: self.randX(), y: 0, width: 105, height: 8)), at: 0)
            self.view.addSubview(self.platforms[0])
        }
        platformTimer = Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { _ in
            self.movePlatforms()
        }
    }
    
    func movePlatforms() {
        for i in platforms {
            i.frame = i.frame.offsetBy(dx: 0, dy: 1)
            if i.frame.maxY >= self.view.frame.height {
                self.platforms.last?.removeFromSuperview()
                self.platforms.popLast()
            }
        }
    }
    
    func randX() -> CGFloat {
        return CGFloat.random(in: 1...self.view.frame.width - 105)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        gameTimer?.invalidate()
        jumpTimer?.invalidate()
    }
}
