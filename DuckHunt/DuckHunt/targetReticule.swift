//
//  targetReticule.swift
//  DuckHunt
//
//  Created by student on 9/25/16.
//  Copyright © 2016 student. All rights reserved.
//

import Foundation
import SpriteKit

class TargetReticule : SKSpriteNode {
    
    // MARK -IVARS-
    let reticuleSprite:String = "crosshair_red_large"
    
    // MARK -Initialization-
    init() {
        let texture  = SKTexture(imageNamed: reticuleSprite)
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK -Methods-
    func update(dt:CGFloat) {
        
    }
}
