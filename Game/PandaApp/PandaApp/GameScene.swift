//
//  GameScene.swift
//  PandaApp
//
//  Created by Tony on 1/23/15.
//  Copyright (c) 2015 Tony. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, ProtocolMainScene, SKPhysicsContactDelegate {
    
    lazy var panda = Panda()
    lazy var platformFactory = PlatformFactory()
    lazy var bg = BackGround()
    
    
    var moveSpeed: CGFloat = 15.0
    var lastDis = CGFloat(0.0)
    
    func didBeginContact(contact: SKPhysicsContact) {
        if (contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask) == (BitMaskType.platform | BitMaskType.panda) {
            panda.run()
            panda.jumpEnd = panda.position.y
            if panda.jumpEnd - panda.jumpStart <= -70 {
                panda.roll()
            }
        }
        
        if (contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask) == (BitMaskType.scene | BitMaskType.panda) {
            print("game over")
        }
    }
    
    func didEndContact(contact: SKPhysicsContact) {
        panda.jumpStart = panda.position.y
    }
    
    override func didMoveToView(view: SKView) {
       let skyColor = SKColor(red: 113/255, green: 197/255, blue: 207/255, alpha: 1)
        self.backgroundColor = skyColor
        
        
        self.addChild(bg)
        bg.zPosition = 20
        
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVectorMake(0, -5)
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        self.physicsBody?.categoryBitMask = BitMaskType.scene
        self.physicsBody?.dynamic = false
        
        panda.position = CGPointMake(200, 400)
        self.addChild(panda)
        panda.zPosition = 40
        
        self.addChild(platformFactory)
        platformFactory.delegate = self
        platformFactory.sceneWidth = self.frame.size.width
        platformFactory.createPlatform(3, x: 0, y: 200)
        platformFactory.zPosition = 30
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
//        if panda.status == Status.run {
//            panda.jump()
//        } else if panda.status == Status.jump {
//            panda.roll()
//        }
        panda.jump()
    }
   
    override func update(currentTime: CFTimeInterval) {
        lastDis -= moveSpeed
        if lastDis <= 0 {
//            platformFactory.createPlatform(1, x: 1500, y: 200)
            platformFactory.createPlatformRandom()
        }
        platformFactory.move(moveSpeed)
        bg.move(moveSpeed/5)
    }
    
    func onGetData(dist: CGFloat) {
        self.lastDis = dist
    }
}

protocol ProtocolMainScene {
    func onGetData(dist: CGFloat)
}
