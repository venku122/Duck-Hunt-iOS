//
//  GameViewController.swift
//  Shooter-1
//
//  Created by student on 9/20/16.
//  Copyright © 2016 student. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    // MARK -ivars-
    var gameScene: GameScene?
    var skView:SKView!
    let showDebugData = true
    let screenSize = CGSize(width: 2048, height: 1536)
    let scaleMode = SKSceneScaleMode.aspectFill
    
    // MARK: -initialization-
    override func viewDidLoad() {
        super.viewDidLoad()
        
        skView = self.view as! SKView
        loadHomeScene()
        
        //debug stuff
        skView.ignoresSiblingOrder = true
        skView.showsFPS = showDebugData
        skView.showsNodeCount = showDebugData
        
        }
    
    // MARK: -Scene Management-
    func loadHomeScene() {
        let scene = HomeScene(size:screenSize, scaleMode:scaleMode, sceneManager: self)
        let reveal = SKTransition.crossFade(withDuration: 1)
        skView.presentScene(scene, transition: reveal)
    }
    
    func loadLevelFinishScene(results:LevelResults) {
        gameScene = nil
        let scene = LevelFinishScene(size:screenSize, scaleMode:scaleMode, results: results, sceneManager:self)
        let reveal = SKTransition.crossFade(withDuration: 1)
        skView.presentScene(scene, transition: reveal)
    }
    
    func loadGameOverScene(results:LevelResults){
        gameScene = nil
        let scene = GameOverScene(size:screenSize, scaleMode:scaleMode, results: results, sceneManager:self)
        let reveal = SKTransition.crossFade(withDuration: 1)
        skView.presentScene(scene, transition: reveal)
    }
    
    func loadGameScene (levelNum:Int, totalScore:Int) {
        gameScene = GameScene(size:screenSize, scaleMode: scaleMode, levelNum: levelNum, totalScore: totalScore, levelTime: 45, numEnemies: 10, sceneManager: self)
    
    // let reveal = SKTransition.flipHorizontal
    let reveal = SKTransition.doorsOpenHorizontal(withDuration: 1)
    skView.presentScene(gameScene!, transition: reveal)
    }

    override var shouldAutorotate: Bool {
        return false
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}



