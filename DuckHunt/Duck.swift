//
//  DiamondSprite.swift
//  Shooter-1
//
//  Created by student on 9/21/16.
//  Copyright © 2016 student. All rights reserved.
//

import Foundation
import SpriteKit

class Duck:SKSpriteNode {
    // MARK -ivars-
    var fwd:CGPoint = CGPoint(x:0.0, y:1.0) // North/Up
    var velocity:CGPoint = CGPoint.zero // Speed with direction
    var delta:CGFloat = 300.0
    var hit:Bool = false
    var spriteString:String = "duck_outline_target_white"
    let duckTexture: SKTexture?

    // MARK -initalization-
    
      init() {
        duckTexture  = SKTexture(imageNamed: spriteString)
        super.init(texture: duckTexture, color: UIColor.clear, size: duckTexture!.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK -Methods-
    func update(dt:CGFloat) {
        velocity = fwd * delta
         position = position + velocity * dt
    }
    
    func reflectX(screenWidth:CGFloat) {
        if position.x > screenWidth {position.x = 0}
        if position.x < 0 {position.x = screenWidth}
    }
    
    func reflectY(screenHeight:CGFloat) {
        if position.y > screenHeight {position.y = 0}
        if position.y < 0 {position.y = screenHeight}
    }
}
