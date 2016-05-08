//
//  GameScene.swift
//  Boxer
//
//  Created by Dulio Denis on 5/8/16.
//  Copyright (c) 2016 Dulio Denis. All rights reserved.
//

import SpriteKit

// Game Variables

var box = SKSpriteNode?()
var floor = SKSpriteNode?()
var boxSize = CGSize(width: 130, height: 130)

var mainLabel = SKLabelNode?()
var scoreLabel = SKLabelNode?()
var boxColor = SKColor?()

var isSpawning = true
var isCollecting = false
var canComplete = false
var logicVar = false

var baseColor: CGFloat = 0.5

var offWhite = SKColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.0)
var offBlack = SKColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)

var touchLocation = CGPoint?()
var score = 0

var countdownTimer = 6
var topCountdownTimer = 5

var touchedNode = SKNode?()


class GameScene: SKScene, SKPhysicsContactDelegate {
    
    override func didMoveToView(view: SKView) {
        backgroundColor = offBlack
        
        physicsBody = SKPhysicsBody(edgeLoopFromRect: frame)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            let touchLocation = touch.locationInNode(self)
        }

    }
    
    func spawnFloor() {
        // Create a floor sprite node
        floor = SKSpriteNode(color: offWhite, size: CGSize(width: self.frame.width, height: 250.0))
        // With a position
        floor?.position = CGPoint(x: CGRectGetMidX(frame), y: CGRectGetMinY(frame))
        // and a physics body for collisions
        floor?.physicsBody = SKPhysicsBody(rectangleOfSize: floor!.size)
        // that itself isn't affected by gravity
        floor?.physicsBody?.affectedByGravity = false
        // but that can be moved
        floor?.physicsBody?.dynamic = true
        // give it a name
        floor?.name = "floorName"
        // add it to the game scene
        addChild(floor!)
    }
   
    override func update(currentTime: CFTimeInterval) {

    }
}
