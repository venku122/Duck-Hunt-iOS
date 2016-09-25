//
//  ShootingRifle.swift
//  DuckHunt
//
//  Created by student on 9/25/16.
//  Copyright © 2016 student. All rights reserved.
//

import Foundation
import SpriteKit

class ShootingRifle : SKSpriteNode {
    // MARK -IVars
    
    let gunSprite: String = "rifle_red"
    
    // MARK -Initialization-
    init() {
        let texture  = SKTexture(imageNamed: gunSprite)
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK -Methods-
    func update(dt:CGFloat) {
        
    }
}
