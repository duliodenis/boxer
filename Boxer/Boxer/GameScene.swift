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
var boxSize = CGSize(width: 60, height: 60)

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
        physicsWorld.contactDelegate = self
        
        spawnFloor()
        spawnMainLabel()
        spawnScore()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches {
            touchLocation = touch.locationInNode(self)
            
            if isSpawning {
                spawnBox()
            }
        }
    }
    
    func spawnFloor() {
        // Create a floor sprite node
        floor = SKSpriteNode(color: offWhite, size: CGSize(width: self.frame.width, height: 100.0))
        // With a position
        floor?.position = CGPoint(x: CGRectGetMidX(frame), y: CGRectGetMinY(frame) + 30)
        // and a physics body for collisions
        floor?.physicsBody = SKPhysicsBody(rectangleOfSize: floor!.size)
        // that itself isn't affected by gravity
        floor?.physicsBody?.affectedByGravity = false
        // not affected by angular force
        floor?.physicsBody?.allowsRotation = false
        // but that can be moved
        floor?.physicsBody?.dynamic = true
        // give it a name
        floor?.name = "floorName"
        // add it to the game scene
        addChild(floor!)
    }
    
    func spawnBox() {
        // make some random colors and add the base
        let redTemp = (CGFloat(arc4random_uniform(255)) / 255) + baseColor
        let greenTemp = (CGFloat(arc4random_uniform(255)) / 255) + baseColor
        let blueTemp = (CGFloat(arc4random_uniform(255)) / 255) + baseColor
        // to make a random color
        let tempColor = UIColor(red: redTemp, green: greenTemp, blue: blueTemp, alpha: 1.0)
        // to make a new box
        box = SKSpriteNode(color: tempColor, size: boxSize)
        box?.position.x = (touchLocation?.x)!
        box?.position.y = (touchLocation?.y)!
        
        box?.physicsBody = SKPhysicsBody(rectangleOfSize: box!.size)
        box?.physicsBody?.affectedByGravity = true
        // up the score by 1 and update
        score += 1
        updateScore()
        // and add to the game scene
        addChild(box!)
    }
    
    func spawnMainLabel() {
        mainLabel = SKLabelNode(fontNamed: "Good Times")
        mainLabel?.fontSize = 80
        mainLabel?.fontColor = offWhite
        mainLabel?.position = CGPoint(x: CGRectGetMidX(frame), y: CGRectGetMidY(frame) + 100)
        mainLabel?.text = "START"
        addChild(mainLabel!)
    }
    
    func spawnScore() {
        scoreLabel = SKLabelNode(fontNamed: "Good Times")
        scoreLabel?.fontSize = 50
        scoreLabel?.fontColor = offBlack
        scoreLabel?.position = CGPoint(x: CGRectGetMidX(frame), y: 30)
        scoreLabel?.text = "Score: \(score)"
        addChild(scoreLabel!)
    }
    
    func updateScore() {
        scoreLabel?.text = "Score: \(score)"
    }
   
    override func update(currentTime: CFTimeInterval) {

    }
}
