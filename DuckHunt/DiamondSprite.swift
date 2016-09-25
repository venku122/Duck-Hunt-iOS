//
//  DiamondSprite.swift
//  Shooter-1
//
//  Created by student on 9/21/16.
//  Copyright © 2016 student. All rights reserved.
//

import Foundation
import SpriteKit

class DiamondSprite:SKSpriteNode {
    // MARK -ivars-
    var fwd:CGPoint = CGPoint(x:0.0, y:1.0) // North/Up
    var velocity:CGPoint = CGPoint.zero // Speed with direction
    var delta:CGFloat = 300.0
    var hit:Bool = false
    var spriteString:String = "duck_outline_target_white"
  
    
    // MARK -initalization-
    
      init() {
        let texture  = SKTexture(imageNamed: spriteString)
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK -Methods-
    func update(dt:CGFloat) {
        velocity = fwd * delta
         position = position + velocity * dt
    }
    
    func reflectX() {
        fwd.x *= CGFloat(-1.0)
    }
    
    func reflectY() {
        fwd.y *= CGFloat(-1.0)
    }
}
