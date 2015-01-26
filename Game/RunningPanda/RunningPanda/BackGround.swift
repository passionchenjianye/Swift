//
//  BackGround.swift
//  RunningPanda
//
//  Created by Tony on 1/21/15.
//  Copyright (c) 2015 Tony. All rights reserved.
//

import SpriteKit

class BackGround: SKNode {
   
    var arrBG = [SKSpriteNode]()//close bg
    
    var arrFar = [SKSpriteNode]()//far bg
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init() {
        super.init()
        var farTexture = SKTexture(imageNamed: "background_f1")//添加远处背景
        
        var farBG0 = SKSpriteNode(texture: farTexture)
        farBG0.anchorPoint = CGPointMake(0, 0)
        farBG0.position.y = 150
        
        var farBG1 = SKSpriteNode(texture: farTexture)
        farBG1.anchorPoint = CGPointMake(0, 0)
        farBG1.position.x = farBG0.frame.width
        farBG1.position.y = 150
        
        var farBG2 = SKSpriteNode(texture: farTexture)
        farBG2.anchorPoint = CGPointMake(0, 0)
        farBG2.position.x = farBG0.frame.width * 2
        farBG2.position.y = 150
        
        self.addChild(farBG0)
        self.addChild(farBG1)
        self.addChild(farBG2)
        arrFar.append(farBG0)
        arrFar.append(farBG1)
        arrFar.append(farBG2)
        
        var texture = SKTexture(imageNamed: "background_f0")//添加近处背景
        
        var bg0 = SKSpriteNode(texture: texture)
        bg0.anchorPoint = CGPointMake(0, 0)
        bg0.position.y = 70
        
        var bg1 = SKSpriteNode(texture: texture)
        bg1.anchorPoint = CGPointMake(0, 0)
        bg1.position.x = bg0.frame.width
        bg1.position.y = 70
        
        self.addChild(bg0)
        self.addChild(bg1)
        arrBG.append(bg0)
        arrBG.append(bg1)
    }
    
    func move(speed: CGFloat) {
        for bg in arrBG {
            bg.position.x -= speed
        }
        
        if arrBG[0].position.x + arrBG[0].frame.width < speed {
            arrBG[0].position.x = 0
            arrBG[1].position.x = arrBG[0].frame.width
        }
        
        for far in arrFar {
            far.position.x -= speed / 4
        }
        
        if arrFar[0].position.x + arrFar[0].frame.width < speed {
            arrFar[0].position.x = 0
            arrFar[1].position.x = arrFar[0].frame.width
            arrFar[2].position.x = arrFar[0].frame.width * 2
        }
    }
}






















