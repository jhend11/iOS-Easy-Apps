//
//  GameScene.swift
//  SAMK
//
//  Created by JOSH HENDERSHOT on 9/22/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var player1 = Character(animal:"bunny")
    var player2 = Character(animal:"panda")
    
    var sun = SKSpriteNode(imageNamed: "sun")
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        self.backgroundColor = UIColor(red: 0.078, green: 0.827, blue: 0.949, alpha: 1.0)
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVectorMake(0.0, -1.9)
        
        sun.size = CGSizeMake(SCREEN_HEIGHT, SCREEN_HEIGHT)
        sun.position = CGPointMake(SCREEN_WIDTH / 2.0, SCREEN_HEIGHT / 2.0)
        self.addChild(sun)
        
        var bg = SKSpriteNode(imageNamed: "bg_front")
        bg.size = self.size
        bg.position = sun.position
        self.addChild(bg)
        
        player1.body.position = CGPointMake(SCREEN_WIDTH / 2.0, 100)
        self.addChild(player1.body)
        
        player2.body.position = CGPointMake(SCREEN_WIDTH / 2.0, 300)
        self.addChild(player2.body)
        
        var floor = SKShapeNode(rectOfSize: CGSizeMake(SCREEN_WIDTH, 10))
        floor.position = CGPointMake(SCREEN_WIDTH / 2.0 ,5)
        floor.fillColor = .darkGrayColor()
        
//        floor.physicsBody = SKPhysicsBody(edgeLoopFromRect: floor.frame)
        
        floor.physicsBody = SKPhysicsBody(rectangleOfSize: floor.frame.size)
        floor.physicsBody?.affectedByGravity = false
        floor.physicsBody?.dynamic = false
        floor.physicsBody?.density = 10000
        self.addChild(floor)

        var floor1 = SKSpriteNode(imageNamed: "cloud")
        floor1.size = CGSizeMake(212, 55)
        floor1.position = CGPointMake(SCREEN_WIDTH / 2.0 ,150)
        floor1.physicsBody = SKPhysicsBody(rectangleOfSize: floor1.frame.size)
        floor1.physicsBody?.affectedByGravity = false
        floor1.physicsBody?.dynamic = false
        self.addChild(floor1)
        
        
        
    }
    
    
    func didBeginContact(contact: SKPhysicsContact) {
        
        if contact.bodyA.node == self {
           
            
        }
        
        player1.checkHit(contact.bodyA, bodyB: contact.bodyB)
        player2.checkHit(contact.bodyA, bodyB: contact.bodyB)
    }
    
    func didEndContact(contact: SKPhysicsContact) {
        
    }

    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        sun.zRotation += 0.01
    }
}
