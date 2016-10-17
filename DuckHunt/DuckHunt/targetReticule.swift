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
        let size = texture.size()
        let sizeX = size.width * 3
        let sizeY = size.height * 3
        super.init(texture: texture, color: UIColor.clear, size: CGSize(width: sizeX, height: sizeY))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK -Methods-
    func update(dt:CGFloat) {
        
    }
}
