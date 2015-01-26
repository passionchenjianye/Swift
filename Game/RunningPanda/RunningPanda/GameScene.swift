//
//  GameScene.swift
//  RunningPanda
//
//  Created by Tony on 1/21/15.
//  Copyright (c) 2015 Tony. All rights reserved.
//

import SpriteKit

protocol ProtocolMainScene {
    func onGetData(dist: CGFloat)
}

class GameScene: SKScene, ProtocolMainScene, SKPhysicsContactDelegate{
    
    lazy var panda = Panda()
    lazy var platformFactory = PlatformFactory()
    lazy var bg = BackGround()
    
    var moveSpeed: CGFloat = 15
    var lastDis = 0.0
    
    
    func onGetData(dist: CGFloat) {
        self.lastDis = Double(dist)
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        if (contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask) == (BitMaskType.platform | BitMaskType.panda) {
            panda.run()
            panda.jumpEnd = panda.position.y
            if panda.jumpEnd - panda.jumpStart <= -70 {
                panda.roll()
            }
        }

        if (contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask) == (BitMaskType.scene | BitMaskType.panda) {
            println("Game Over!!!")
        }
    }
    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "小梁是猪, 打她";
        myLabel.fontSize = 65;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        
        let skyColor = SKColor(red: 133/255, green: 197/255, blue: 207/255, alpha: 1)
        self.backgroundColor = skyColor
        
        self.addChild(bg)
        bg.zPosition = 20
        
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVectorMake(0, -5)
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        self.physicsBody?.categoryBitMask = BitMaskType.scene
        self.physicsBody?.dynamic = false
        
        panda.position = CGPointMake(200, 400)
        panda.zPosition = 40
        self.addChild(panda)
        
        self.addChild(platformFactory)
        platformFactory.delegate = self
        platformFactory.sceneWidth = self.frame.size.width
        platformFactory.zPosition = 30
        platformFactory.createPlatform(3, x: 100, y: 200)
        
        
        self.addChild(myLabel)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
        var location = touches.anyObject()?.locationInNode(self)
        var l = SKLabelNode()
        l.text = "小梁打掉了"
        addChild(l)
        l.position = location!
        l.physicsBody = SKPhysicsBody(rectangleOfSize: l.frame.size)
        panda.jump()
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        bg.move(moveSpeed/15)
        lastDis -= Double(moveSpeed)
        if lastDis <= 0 {
//            println("generate new platform")
            platformFactory.createPlatformRandom()
        }
        platformFactory.move(self.moveSpeed)

    }
}















