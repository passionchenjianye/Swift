//
//  GameScene.swift
//  PlaneWar
//
//  Created by Tony on 1/13/15.
//  Copyright (c) 2015 Tony. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var heroPlane: SKSpriteNode!
    var scoreLabel: SKLabelNode!
    var pauseButton: SKSpriteNode!
    
    var smallPlaneHitAction: SKAction!
    var smallPlaneBlowUpAction: SKAction!
    var mediumPlaneHitAction: SKAction!
    var mediumPlaneBlowUpAction: SKAction!
    var largePlaneHitAction: SKAction!
    var largePlaneBlowUpAction: SKAction!
    var heroPlaneBlowUpAction: SKAction!
    
    enum RoleCategory: UInt32 {
        case Bullet = 1
        case HeroPlane = 2
        case EnemyPlane = 4
    }
    
    
    
    override func didMoveToView(view: SKView) {
        initBackground()
        initActions()
        initHeroPlane()
        initEnemyPlane()
        initScoreLabel()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "restart", name: "restartNotification", object: nil)
    }
    
    func initBackground() {
        
        //创建背景texture
        let backgroundTexture = SKTexture(imageNamed: "background")
        backgroundTexture.filteringMode = .Nearest
        
        //设置背景动作
        let moveBackgroundSprite = SKAction.moveByX(0, y: -backgroundTexture.size().height, duration: 5)
        let resetBackgroundSprite = SKAction.moveByX(0, y: backgroundTexture.size().height, duration: 0)
        let moveBackgroundForever = SKAction.repeatActionForever(SKAction.sequence([moveBackgroundSprite, resetBackgroundSprite]))
        
        //初始化背景精灵
        for index in 0...2 {
            let backgroundSprite = SKSpriteNode(texture: backgroundTexture)
            backgroundSprite.position = CGPointMake(size.width/2, size.height/2 + CGFloat(index) * backgroundSprite.size.height)
            backgroundSprite.zPosition = 0
            backgroundSprite.runAction(moveBackgroundForever)
            self.addChild(backgroundSprite)
        }
        
        //播放背景声音
        runAction(SKAction.repeatActionForever(SKAction.playSoundFileNamed("game_music.mp3", waitForCompletion: true)))
        
        // set physics world
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVectorMake(0, 0)
        
    }
    
    func initActions() {
        
        //小飞机爆炸动作
        var smallPlaneBlowUpTexture = [SKTexture]()
        for i in 1...4 {
            smallPlaneBlowUpTexture.append(SKTexture(imageNamed: "enemy1_blowup_\(i)"))
        }
        
        println(smallPlaneBlowUpTexture)
        
        smallPlaneBlowUpAction = SKAction.sequence([SKAction.animateWithTextures(smallPlaneBlowUpTexture, timePerFrame: 0.1), SKAction.removeFromParent()])
        
        //中等飞机撞击动作
        var mediumPlaneHitTexture = [SKTexture]()
        mediumPlaneHitTexture.append(SKTexture(imageNamed: "enemy3_hit_1"))
        mediumPlaneHitTexture.append(SKTexture(imageNamed: "enemy3_fly_1"))
        mediumPlaneHitAction = SKAction.animateWithTextures(mediumPlaneHitTexture, timePerFrame: 0.1)
        
        //中等飞机爆炸动作
        var mediumPlaneBlowUpTexture = [SKTexture]()
        for i in 1...4 {
            mediumPlaneBlowUpTexture.append(SKTexture(imageNamed: "enemy3_blowup_\(i)"))
        }
        
        println(mediumPlaneBlowUpTexture)
        
        mediumPlaneBlowUpAction = SKAction.sequence([SKAction.animateWithTextures(mediumPlaneBlowUpTexture, timePerFrame: 0.1),SKAction.removeFromParent()])
        
        //大飞机撞击动作
        var largePlaneHitTexture = [SKTexture]()
        largePlaneHitTexture.append(SKTexture(imageNamed: "enemy2_hit_1"))
        largePlaneHitTexture.append(SKTexture(imageNamed: "enemy2_fly_2"))
        largePlaneHitAction = SKAction.animateWithTextures(largePlaneHitTexture, timePerFrame: 0.1)
        
        //大飞机爆炸动作
        var largePlaneBlowUpTexture = [SKTexture]()
        for i in 1...7 {
            largePlaneBlowUpTexture.append(SKTexture(imageNamed: "enemy2_blowup_\(i)"))
        }
        
        println(largePlaneBlowUpTexture)
        
        largePlaneBlowUpAction = SKAction.sequence([SKAction.animateWithTextures(largePlaneBlowUpTexture, timePerFrame: 0.1), SKAction.removeFromParent()])
        
        //英雄飞机爆炸动作
        var heroPlaneBlowUpTexture = [SKTexture]()
        for i in 1...4 {
            heroPlaneBlowUpTexture.append(SKTexture(imageNamed: "hero_blowup_\(i)"))
        }
        heroPlaneBlowUpAction = SKAction.sequence([SKAction.animateWithTextures(heroPlaneBlowUpTexture, timePerFrame: 0.1), SKAction.removeFromParent()])
        
    }
    
    func initHeroPlane() {
        let heroPlaneTexture1 = SKTexture(imageNamed: "hero_fly_1")
        let heroPlaneTexture2 = SKTexture(imageNamed: "hero_fly_2")
        
        heroPlane = SKSpriteNode(texture: heroPlaneTexture1)
        heroPlane.setScale(0.5)
        heroPlane.position = CGPointMake(size.width / 2, size.height * 0.3)
        heroPlane.zPosition = 1
        let heroPlaneAction = SKAction.animateWithTextures([heroPlaneTexture1,heroPlaneTexture2], timePerFrame: 0.1)
        heroPlane.runAction(SKAction.repeatActionForever(heroPlaneAction))
        
        heroPlane.physicsBody = SKPhysicsBody(texture: heroPlaneTexture1, size: heroPlane.size)
        heroPlane.physicsBody?.allowsRotation = false
        heroPlane.physicsBody?.categoryBitMask = RoleCategory.HeroPlane.rawValue
        heroPlane.physicsBody?.collisionBitMask = 0
        heroPlane.physicsBody?.contactTestBitMask = RoleCategory.EnemyPlane.rawValue
        
        self.addChild(heroPlane)
        
        //发射子弹
        let spawn = SKAction.runBlock{() in self.createBullet()}
        let wait = SKAction.waitForDuration(0.2)
        heroPlane.runAction(SKAction.repeatActionForever(SKAction.sequence([spawn, wait])))
    }
    
    func createBullet() {
        let bulletTexture = SKTexture(imageNamed: "bullet1")
        let bullet = SKSpriteNode(texture: bulletTexture)
        bullet.setScale(0.5)
        bullet.position = CGPointMake(heroPlane.position.x, heroPlane.position.y + heroPlane.size.height / 2 + bullet.size.height / 2)
        bullet.zPosition = 1
        
        let bulletMove = SKAction.moveByX(0, y: size.height, duration: 0.5)
        let bulletRemove = SKAction.removeFromParent()
        bullet.runAction(SKAction.sequence([bulletMove, bulletRemove]))
        
        bullet.physicsBody = SKPhysicsBody(rectangleOfSize: bullet.size)
        bullet.physicsBody?.allowsRotation = false
        bullet.physicsBody?.categoryBitMask = RoleCategory.Bullet.rawValue
        bullet.physicsBody?.collisionBitMask = RoleCategory.EnemyPlane.rawValue
        bullet.physicsBody?.contactTestBitMask = RoleCategory.EnemyPlane.rawValue
        
        self.addChild(bullet)
        
        //设置发射子弹音效
        runAction(SKAction.playSoundFileNamed("bullet.mp3", waitForCompletion: false))
    }
    
    
    func initEnemyPlane() {
        let spawn = SKAction.runBlock{() in self.createEnemyPlane()}
        let wait = SKAction.waitForDuration(0.4)
        
        runAction(SKAction.repeatActionForever(SKAction.sequence([spawn, wait])))
        
    }
    
    func createEnemyPlane() {
        let choose = arc4random() % 100
        var type: EnemyPlaneType
        var speed: Float
        var enemyPlane: EnemyPlane
        
        switch choose {
            case 0...75:
                type = .Small
                speed = Float(arc4random() % 3) + 4
                enemyPlane = EnemyPlane.createSmallPlane()
            case 75...97:
                type = .Medium
                speed = Float(arc4random() % 3) + 6
                enemyPlane = EnemyPlane.createMediumPlane()
            case _:
                type = .Large
                speed = Float(arc4random() % 3) + 8
                enemyPlane = EnemyPlane.createLargePlane()
                runAction(SKAction.playSoundFileNamed("enemy2_out.mp3", waitForCompletion: false))
        }
        
        enemyPlane.zPosition = 1
        enemyPlane.physicsBody?.dynamic = true
        enemyPlane.physicsBody?.allowsRotation = false
        enemyPlane.physicsBody?.categoryBitMask = RoleCategory.EnemyPlane.rawValue
        enemyPlane.physicsBody?.collisionBitMask = RoleCategory.Bullet.rawValue | RoleCategory.HeroPlane.rawValue
        enemyPlane.physicsBody?.contactTestBitMask = RoleCategory.Bullet.rawValue | RoleCategory.HeroPlane.rawValue
        
        let x = (arc4random() % 220) + 35
        enemyPlane.position = CGPointMake(CGFloat(x), size.height + enemyPlane.size.height / 2)
        
        let moveAction = SKAction.moveToY(0, duration: NSTimeInterval(speed))
        let remove = SKAction.removeFromParent()
        enemyPlane.runAction(SKAction.sequence([moveAction, remove]))
        
        self.addChild(enemyPlane)
        
    }
    
    func didBeginContact(contact: SKPhysicsContact!) {
        let enemyPlane = contact.bodyA.categoryBitMask & RoleCategory.EnemyPlane.rawValue == RoleCategory.EnemyPlane.rawValue ? contact.bodyA.node as EnemyPlane : contact.bodyB.node as EnemyPlane
        
        let collision = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        if collision == RoleCategory.EnemyPlane.rawValue | RoleCategory.Bullet.rawValue {
            let bullet =  contact.bodyA.categoryBitMask & RoleCategory.Bullet.rawValue == RoleCategory.Bullet.rawValue ? contact.bodyA.node as SKSpriteNode : contact.bodyB.node as SKSpriteNode
            bullet.runAction(SKAction.removeFromParent())
            enemyPlaneCollision(enemyPlane)
        } else if collision == RoleCategory.EnemyPlane.rawValue | RoleCategory.HeroPlane.rawValue {
            let heroPlane = contact.bodyA.categoryBitMask & RoleCategory.HeroPlane.rawValue == RoleCategory.HeroPlane.rawValue ? contact.bodyA.node as SKSpriteNode : contact.bodyB.node as SKSpriteNode
            
            heroPlane.runAction(heroPlaneBlowUpAction, completion: {() in self.runAction(SKAction.sequence([SKAction.playSoundFileNamed("game_over.mp3", waitForCompletion: true),SKAction.runBlock{() in
                    let label = SKLabelNode(fontNamed:"MarkerFelt-Thin")
                    label.text = "GameOver"
                    label.zPosition = 2
                    label.fontColor = SKColor.blackColor()
                    label.position = CGPointMake(self.size.width / 2, self.size.height / 2 + 20)
                    self.addChild(label)
                }]), completion: {() in self.resignFirstResponder()
                    NSNotificationCenter.defaultCenter().postNotificationName("gameOverNotification", object: nil)
            })})
            
        }
    }

    
    func enemyPlaneCollision(enemyPlane: EnemyPlane) {
        enemyPlane.hp--
        if enemyPlane.hp < 0 {
            enemyPlane.hp = 0
        }
        if enemyPlane.hp > 0 {
            switch enemyPlane.type {
            case .Small:
                enemyPlane.runAction(smallPlaneHitAction)
            case .Medium:
                enemyPlane.runAction(mediumPlaneHitAction)
            case .Large:
                enemyPlane.runAction(largePlaneHitAction)
            }
        } else {
            switch enemyPlane.type {
            case .Small:
                changeScore(.Small)
                enemyPlane.runAction(smallPlaneBlowUpAction)
                runAction(SKAction.playSoundFileNamed("enemy1_down.mp3", waitForCompletion: false))
            case .Medium:
                changeScore(.Medium)
                enemyPlane.runAction(mediumPlaneBlowUpAction)
                runAction(SKAction.playSoundFileNamed("enemy2_down.mp3", waitForCompletion: false))
            case .Large:
                changeScore(.Large)
                enemyPlane.runAction(largePlaneBlowUpAction)
                runAction(SKAction.playSoundFileNamed("enemy3_down.mp3", waitForCompletion: false))
            }
        }
    }
    
    func changeScore(type:EnemyPlaneType) {
        var score: Int
        switch type {
        case .Large:
            score = 30000
        case .Medium:
            score = 6000
        case .Small:
            score = 1000
        }
        
        scoreLabel.runAction(SKAction.runBlock{() in self.scoreLabel.text = "\(self.scoreLabel.text.toInt()! + score)"})
    }
    
    func initScoreLabel() {
        scoreLabel = SKLabelNode(fontNamed: "MarkerFelt-Thin")
        scoreLabel.text = "0000"
        scoreLabel.zPosition = 2
        scoreLabel.fontColor = SKColor.blackColor()
        scoreLabel.horizontalAlignmentMode = .Left
        scoreLabel.position = CGPointMake(220,size.height - 52)
        self.addChild(scoreLabel)
    }
    
    func restart() {
        removeAllChildren()
        removeAllActions()
        
        initBackground()
        initScoreLabel()
        initHeroPlane()
        initEnemyPlane()
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        let anyTouch: AnyObject! = touches.anyObject()
        let location = anyTouch.locationInNode(self)
        heroPlane.runAction(SKAction.moveTo(location, duration: 0))
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        let anyTouch: AnyObject! = touches.anyObject()
        let location = anyTouch.locationInNode(self)
        heroPlane.runAction(SKAction.moveTo(location, duration: 0))
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
}


