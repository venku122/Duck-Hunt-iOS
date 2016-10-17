//
//  EmptyBullet.swift
//  DuckHunt
//
//  Created by student on 10/17/16.
//  Copyright © 2016 student. All rights reserved.
//

import Foundation
import SpriteKit

class AmmoNode:SKSpriteNode {
    // MARK -IVARS-
    let emptySprite:String = "empty_ammo"
    let fullSprite:String = "full_ammo"
    let fullTexture : SKTexture?
    let emptyTexture : SKTexture?
    
    // MARK -Initialization-
    init() {
        fullTexture = SKTexture(imageNamed: fullSprite)
        emptyTexture = SKTexture(imageNamed: emptySprite)
        super.init(texture: fullTexture, color: UIColor.clear, size: fullTexture!.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK -Methods-
    func deplete() {
        super.texture = emptyTexture
    }
    
    func reload() {
        super.texture = fullTexture
    }
    
       
    
}
