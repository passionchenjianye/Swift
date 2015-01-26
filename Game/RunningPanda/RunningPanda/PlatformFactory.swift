//
//  PlatformFactory.swift
//  RunningPanda
//
//  Created by Tony on 1/21/15.
//  Copyright (c) 2015 Tony. All rights reserved.
//

//import SpriteKit
//
//class PlatformFactory: SKNode {
//   
//    let textureLeft = SKTexture(imageNamed: "platform_l")
//    
//    let textureMiddle = SKTexture(imageNamed: "platform_m")
//    
//    let textureRight = SKTexture(imageNamed: "platform_r")
//    
//    var platforms = [Platform]()
//    
//    var sceneWidth: CGFloat = 0
//    
//    var delegate: ProtocolMainScene?
//    
//    func createPlatformRandom() {
//        let midNum: UInt32 = arc4random() % 4 + 1
//        println("平台的长度: \(midNum)")
//        
//        let gap: CGFloat = CGFloat(arc4random() % 8 + 1)
//        println("随机间隔: \(gap)")
//        
//        let x: CGFloat = self.sceneWidth + CGFloat(midNum * 50) + gap + 100
//        println("x坐标: \(x)")
//        
//        let y: CGFloat = CGFloat(arc4random() % 201 + 200)
//        println("y坐标: \(y)")
//        
//        createPlatform(midNum, x: x, y: y)
//    }
//    
//    func createPlatform(midNum: UInt32, x: CGFloat, y: CGFloat) {
//        
//        let platform = Platform()
//        platform.position = CGPointMake(x, y)
//        
//        let platform_left = SKSpriteNode(texture: textureLeft)
//        platform_left.anchorPoint = CGPointMake(0, 0.9)
//        
//        let platform_right = SKSpriteNode(texture: textureRight)
//        platform_right.anchorPoint = CGPointMake(0, 0.9)
//        
//        var arrPlatform = [SKSpriteNode]()
//        arrPlatform.append(platform_left)
//        
//        for i in 1...midNum {
//            let platform_middle = SKSpriteNode(texture: textureMiddle)
//            platform_middle.anchorPoint = CGPointMake(0, 0.9)
//            arrPlatform.append(platform_middle)
//        }
//        
//        arrPlatform.append(platform_right)
//        
//        platform.onCreate(arrPlatform)
//        self.addChild(platform)
//        platforms.append(platform)
//        
//        delegate?.onGetData(CGFloat(platform.width) + x - sceneWidth)
//    }
//    
//
//    func move(speed: CGFloat) {
//        for p in platforms {
//            p.position.x -= speed
//        }
//        
//        if platforms[0].position.x < -CGFloat(platforms[0].width) {
//            println(platforms[0].position.x)
//            println(-platforms[0].width)
//            platforms[0].removeFromParent()
//            platforms.removeAtIndex(0)
//        }
//    }
//}




//
//  PlatformFactory.swift
//  panda
//
//  Created by JackLee on 14-7-16.
//  Copyright (c) 2014年 swift520@126.com. All rights reserved.
//

import SpriteKit

class PlatformFactory: SKNode {
    let textureLeft = SKTexture(imageNamed: "platform_l")
    let textureMid = SKTexture(imageNamed: "platform_m")
    let textureRight = SKTexture(imageNamed: "platform_r")
    
    var platforms = [Platform]()
    var sceneWidth: CGFloat = 0
    var delegate: ProtocolMainScene?
    
    func createPlatformRandom() {
        //随机平台的长度1-4
        let midNum: UInt32 = arc4random()%4 + 1
//        println("平台的长度: \(midNum)")
        
        //随机间隔1-8
        //let gap: CGFloat = CGFloat(Float(arc4random()%8 + 1))
        let gap: CGFloat = CGFloat(arc4random()%8 + 1) //beta 5
//        println("随机间隔: \(gap)")
        
        //x坐标
        //let x: CGFloat = self.sceneWidth + CGFloat(Float(midNum*50)) + gap + 100//
        let x: CGFloat = self.sceneWidth + CGFloat(midNum*50) + gap + 100 //beta5
//        println("x坐标: \(x)")
        
        //y坐标200-400
        //let y: CGFloat = CGFloat(Float(arc4random()%201 + 200))
        let y: CGFloat = CGFloat(arc4random()%201 + 200) //beta 5
//        println("y坐标: \(y)")
        
        createPlatform(midNum, x: x, y: y)
        
    }
    
    func createPlatform(midNum: UInt32, x: CGFloat, y: CGFloat) {
        let platform = Platform()
        platform.position = CGPointMake(x, y)
        
        let platform_left = SKSpriteNode(texture: textureLeft)
        platform_left.anchorPoint = CGPointMake(0, 0.9)
        
        let platform_right = SKSpriteNode(texture: textureRight)
        platform_right.anchorPoint = CGPointMake(0, 0.9)
        
        var arrPlatform = [SKSpriteNode]()
        arrPlatform.append(platform_left)
        for i in 1...midNum {
            let platform_mid = SKSpriteNode(texture: textureMid)
            platform_mid.anchorPoint = CGPointMake(0, 0.9)
            arrPlatform.append(platform_mid)
        }
        arrPlatform.append(platform_right)
        
        platform.onCreate(arrPlatform)
        self.addChild(platform)
        
        platforms.append(platform)
        //通用公式:平台的长度+x坐标-主场景的宽度
        delegate?.onGetData(CGFloat(platform.width) + x - sceneWidth) //
        
    }
    
    func move(speed: CGFloat) {
        for p in platforms {
            p.position.x -= speed
        }
        
        if platforms[0].position.x < -CGFloat(platforms[0].width) { //
//            println(platforms[0].position.x)
//            println(-platforms[0].width)
            //println(platforms[0].parent.description)
            platforms[0].removeFromParent()
            platforms.removeAtIndex(0)
        }
    }
}













