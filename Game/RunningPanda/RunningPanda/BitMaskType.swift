//
//  BitMaskType.swift
//  RunningPanda
//
//  Created by Tony on 1/21/15.
//  Copyright (c) 2015 Tony. All rights reserved.
//

import UIKit

class BitMaskType {
    
    class var panda: UInt32 {
            return 1 << 0
    }
    
    class var platform: UInt32 {
        return 1<<1
    }
    
    class var apple: UInt32 {
        return 1<<2
    }
    
    class var scene: UInt32 {
        return 1<<3
    }
}
