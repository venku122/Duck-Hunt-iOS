//
//  BulletSprite.swift
//  DuckHunt
//
//  Created by student on 9/26/16.
//  Copyright © 2016 student. All rights reserved.
//

import Foundation
import SpriteKit

class BulletSprite : SKSpriteNode {
    
    // MARK -IVARS-
    let bulletSprite:String = "smallBullet"
    let bulletTexture : SKTexture?
    
    // MARK -Initialization-
    init() {
        bulletTexture = SKTexture(imageNamed: bulletSprite)
        super.init(texture: bulletTexture, color: UIColor.clear, size: bulletTexture!.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK -Methods-
    func update(dt:CGFloat) {
        
    }
    
    func moveTo(pos:CGPoint) {
        let moveBullet = SKAction.move(to: pos, duration: 2)
        run(moveBullet)
    }
}
