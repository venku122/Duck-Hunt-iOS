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
        
        /*
        let halfHeight = size.height/2
        let halfWidth = size.width/2
        let top = CGPoint(x:0, y:halfHeight)
        let right = CGPoint(x:halfWidth, y:0)
        let bottom = CGPoint(x:0, y:-halfHeight)
        let left = CGPoint(x:-halfWidth, y:0)
        
        let pathToDraw = CGMutablePath()
        pathToDraw.move(to: top)
        pathToDraw.addLine(to: right)
        pathToDraw.addLine(to: bottom)
        pathToDraw.addLine(to: left)
        pathToDraw.closeSubpath()
        path = pathToDraw
        self.strokeColor = strokeColor
        self.lineWidth = lineWidth
        self.fillColor = fillColor
        
        */
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
