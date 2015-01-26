import SpriteKit

class PlatformFactory: SKNode {
    let textureLeft = SKTexture(imageNamed: "platform_l")
    let textureMiddle = SKTexture(imageNamed: "platform_m")
    let textureRight = SKTexture(imageNamed: "platform_r")
    
    var platforms = [Platform]()
    
    var sceneWidth: CGFloat = 0
    var delegate: ProtocolMainScene?
    
    func createPlatformRandom() {
        let midNum: UInt32 = arc4random()%4 + 1//1 到 4的 随机数
        let gap: CGFloat = CGFloat(arc4random()%8 + 1) //1到8的 间隔
        let x:CGFloat = self.sceneWidth + CGFloat(50 * midNum) + gap + 100
        let y:CGFloat = CGFloat(arc4random()%200 + 200)
        
        createPlatform(midNum, x: x, y: y)
    }
    
    func createPlatform(middleNum: UInt32, x: CGFloat, y: CGFloat) {
        let platform = Platform()
        let platform_left = SKSpriteNode(texture: textureLeft)
        platform_left.anchorPoint = CGPointMake(0, 0.9)
        
        let platform_right = SKSpriteNode(texture: textureRight)
        platform_right.anchorPoint = CGPointMake(0, 0.9)
        
        var arrPlatform = [SKSpriteNode]()
        arrPlatform.append(platform_left)
        platform.position = CGPointMake(x, y)
        
        for i in 1...middleNum {
            let platform_middle = SKSpriteNode(texture: textureMiddle)
            platform_middle.anchorPoint = CGPointMake(0, 0.9)
            arrPlatform.append(platform_middle)
        }
        
        arrPlatform.append(platform_right)
        
        platform.onCreate(arrPlatform)
        
        self.addChild(platform)
        
        platforms.append(platform)
        
        delegate?.onGetData(platform.width + x - sceneWidth)
    }
    
    func move(speed: CGFloat) {
        for p in platforms {
            p.position.x -= speed
        }
        
        if platforms[0].position.x < -platforms[0].width {
            platforms[0].removeFromParent()
            platforms.removeAtIndex(0)
        }
    }
}







