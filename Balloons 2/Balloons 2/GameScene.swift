//
//  GameScene.swift
//  Balloons 2
//
//  Created by JOSH HENDERSHOT on 8/21/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var centerPoint = CGPointMake(0, 0)
    let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
    var balloons:[SKSpriteNode] = []

    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
//        var centerPoint = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))

//        let myLabel = SKLabelNode(fontNamed:"Zapfino")
//        myLabel.text = "Hello, Jo!";
//        myLabel.fontSize = 65;
//        myLabel.position = centerPoint
//        myLabel.xScale = 0.5
//        myLabel.yScale = 0.5
//        self.addChild(myLabel)
        
//        self.physicsBody = SKPhysicsBody(circleOfRadius: spriteNode.frame.size.width/2.0)

        self.physicsWorld.gravity = CGVectorMake(0.0, -0.4)
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
//        self.physicsBody = SKPhysicsContact
        
    func createBalloons()
    {
        for i in 0...9 {
        
            var spriteNode = SKSpriteNode(imageNamed: "balloon")
            spriteNode.physicsBody = SKPhysicsBody(circleOfRadius: spriteNode.frame.size.width/2.0)

            var floatI = CGFloat(i)

            spriteNode.xScale = 0.5
            spriteNode.yScale = 0.5
            spriteNode.physicsBody.restitution = 0.8
            spriteNode.physicsBody.mass = 0.2
            spriteNode.physicsBody.categoryBitMask = 10
            
//            spriteNode.physicsBody = SKPhysicsBody(edgeFromPoint: self.view.frame.origin toPoint: CGPointMake(CGRectGetMaxX(self.view), CGPointMake(CGRectGetMaxY(self.view))))
            
//            spriteNode.runAction(SKAction.repeatActionForever(action))
            
            spriteNode.position = CGPointMake(self.frame.width / 10.0 * floatI, 300)
            
            self.addChild(spriteNode)
            
            balloons += [spriteNode]
            }
        }
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            var dart = SKSpriteNode(imageNamed: "Dart")
            self.physicsWorld.contactDelegate = self

            dart.position = location
            dart.physicsBody = SKPhysicsBody(rectangleOfSize: dart.frame.size)
            dart.physicsBody.contactTestBitMask = 10
            self.addChild(dart)
            
            
//            let sprite = SKSpriteNode(imageNamed:"Josface")
//            sprite.xScale = 5.5
//            sprite.yScale = 5.5
//            sprite.position = location
//            sprite.runAction(SKAction.repeatActionForever(action))
//            self.addChild(sprite)
        }
    }
    
    func didBeginContact(contact: SKPhysicsContact!) {
        for balloon in balloons
            {
            if balloon == contact.bodyA.node || balloon == contact.bodyB.node
            {
                balloons.removeLast()
                balloon.removeFromParent()
                var pop = SKAction.playSoundFileNamed("pop.mp3", waitForCompletion: false)
                self.runAction(pop)
            }
        }
//        if self.children.count == dartCount
//        {
//            self.createBalloons()
//            
//        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
