//
//  Character.swift
//  SAMK
//
//  Created by JOSH HENDERSHOT on 9/22/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

import UIKit
import SpriteKit

let FIRE_CONTACT: UInt32 = 1
let PLAYER_CONTACT: UInt32 = 2
let MAX_HP: Int = 100

class Character: NSObject {
    
    var direction: CGFloat = 1 // right
    var body: SKSpriteNode!
    var body2: SKSpriteNode!
    var scene: GameScene!
    var textureNames: [String] = []
//    var textureNames2: [String] = []
    var currentHP: Int = 100

    
    init(animal:String) {
        super.init()
        
        var characterAtlas = SKTextureAtlas(named: animal)
        textureNames = sorted(characterAtlas.textureNames as [String],<)
        body = SKSpriteNode(imageNamed: textureNames[0] as String)
        body.size = CGSizeMake(54, 116)
        body.physicsBody = SKPhysicsBody(rectangleOfSize: body.frame.size)
        body.physicsBody?.allowsRotation = false
        
//        body.physicsBody?.categoryBitMask = FIRE_CONTACT
        
//        var characterAtlas1 = SKTextureAtlas(named: "panda")
//        textureNames2 = sorted(characterAtlas1.textureNames as [String],<)
//        body2 = SKSpriteNode(imageNamed: textureNames2[0] as String)
//        body2.size = CGSizeMake(54, 116)
//        body2.physicsBody = SKPhysicsBody(rectangleOfSize: body2.frame.size)
//        body.fillColor = UIColor.whiteColor()
        
    
    }
    func texturesFromNames()-> [SKTexture] {
        var textures: [SKTexture] = []
        for textureName in textureNames {
            textures.append(SKTexture(imageNamed: textureName))
        }
//        for textureName in textureNames2 {
//            textures.append(SKTexture(imageNamed: textureName))
//        }
        return textures
    }
    
    func checkHit(bodyA:SKPhysicsBody, bodyB:SKPhysicsBody) {
        
        if bodyA.node == body {
            
            currentHP -= 10
            bodyB.node?.removeFromParent()
            
            NSNotificationCenter.defaultCenter().postNotificationName("healthUpdate", object: nil, userInfo: ["player":self])
        }
        if bodyB.node == self {
            
            currentHP -= 10
            bodyA.node?.removeFromParent()
        }
    }
    
    func moveLeft() {
        direction = -1
        
        var walkAction = SKAction.animateWithTextures(texturesFromNames(), timePerFrame: 0.1, resize: true, restore: true)
        body.physicsBody?.applyImpulse(CGVectorMake(-40, 0))
        body.runAction(walkAction)
        body.xScale = direction
        
//        body2.physicsBody?.applyImpulse(CGVectorMake(-40, 0))
//        body2.runAction(walkAction)
//        body2.xScale = direction
    }
    func moveRight() {
        direction = 1
        body.physicsBody?.applyImpulse(CGVectorMake(40, 0))
        
        var walkAction = SKAction.animateWithTextures(texturesFromNames(), timePerFrame: 0.1, resize: true, restore: true)
        body.runAction(walkAction)
        body.xScale = direction
        
//        body2.physicsBody?.applyImpulse(CGVectorMake(-40, 0))
//        body2.runAction(walkAction)
//        body2.xScale = direction
    }
    func jump() {
        
        body.physicsBody?.applyImpulse(CGVectorMake(0, 50))
    }
    func fire() {
        
        var particlePath = NSBundle.mainBundle().pathForResource("MyParticle", ofType: "sks")
        var sceneData = NSData.dataWithContentsOfFile(particlePath!, options: .DataReadingMappedIfSafe, error: nil)
        var archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
        
        archiver.setClass(SKEmitterNode.self, forClassName: "SKEditorScene")
        let node = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as SKEmitterNode?
        archiver.finishDecoding()
        
        var kamehameha = node!
        
        //        var kamehameha = SKShapeNode(rectOfSize: CGSizeMake(100, 100), cornerRadius: 50)
        
        //        var kamehameha = NSKeyedUnarchiver.unarchiveObjectWithFile(particlePath!) as SKEmitterNode
        //        kamehameha.fillColor = UIColor.cyanColor()
        
        kamehameha.position = CGPointMake(body.position.x + 80 * direction, body.position.y)
        kamehameha.physicsBody = SKPhysicsBody(circleOfRadius: 50)
        kamehameha.physicsBody?.affectedByGravity = false
        
//        scene.addChild(kamehameha)
        
        body.parent?.addChild(kamehameha)
        
        kamehameha.physicsBody?.applyImpulse(CGVectorMake(20 * direction, 0.0))
        
        body.physicsBody?.applyImpulse(CGVectorMake(-10.0 * direction, 0))
        
        kamehameha.physicsBody?.contactTestBitMask = FIRE_CONTACT
//        kamehameha.physicsBody?.categoryBitMask = FIRE_CONTACT
    }
}
