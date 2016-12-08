//
//  HomeScene.swift
//  Shooter-1
//
//  Created by student on 9/20/16.
//  Copyright © 2016 student. All rights reserved.
//

import SpriteKit
class HomeScene: SKScene, SKTGameControllerDelegate {
    // MARK: -ivars-
    let sceneManager:GameViewController
    let button:SKLabelNode = SKLabelNode(fontNamed: GameData.font.mainFont)
    let background = SKSpriteNode(imageNamed: "firstScreen")
    // MARK -Initialization-
    init(size: CGSize, scaleMode:SKSceneScaleMode, sceneManager:GameViewController) {
        self.sceneManager = sceneManager
        super.init(size: size)
        self.scaleMode = scaleMode
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        let playableRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        backgroundColor = GameData.scene.backgroundColor
        let label = SKLabelNode(fontNamed: GameData.font.mainFont)
        let label2 = SKLabelNode(fontNamed: GameData.font.mainFont)
        label.text = "Duck Hunt"
        label2.text  = "Talledega Knights"
        
        label.fontSize = 200
        label2.fontSize = 200
        
        label.position = CGPoint(x:size.width/2, y:size.height/2 + 400)
        label2.position = CGPoint(x:size.width/2, y:size.height/2 - 200)
        
        label.zPosition = 1;
        label2.zPosition = 1;
        addChild(label)
        addChild(label2)
        
        // label3 was an image
        
        let label4 = SKLabelNode(fontNamed: GameData.font.mainFont)
        label4.text = "Tap or press A to Start"
        label4.fontColor = UIColor.red
        label4.fontSize = 70
        label4.position = CGPoint(x:size.width/2, y:size.height/2 - 400)
        addChild(label4)
        
        background.position = CGPoint(x: playableRect.maxX / 2, y: playableRect.maxY / 2)
        background.zPosition = -10
        addChild(background)
        SKTGameController.sharedInstance.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        sceneManager.loadGameScene(levelNum: 1, totalScore: 0)
    }
    
    // MARK: - SKTGameControllerDelegate
    // call by "A" button
    func buttonEvent(event: String, velocity: Float, pushedOn: Bool) {
        
        if pushedOn == false {
            
            print("button released")
            sceneManager.loadGameScene(levelNum: 1, totalScore: 0)
        }
    }
    
    func stickEvent(event: String, point: CGPoint) {
        
    }
   
    
    
}
