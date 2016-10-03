//
//  GameScene.swift
//  Shooter-1
//
//  Created by student on 9/20/16.
//  Copyright © 2016 student. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var levelNum:Int {
        didSet {
            timeLabel.text = "Level: \(levelNum)"
        }
    }
    var tapCount = 0 // three taps and the game is over
    var levelScore:Int = 0 {
        didSet {
            scoreLabel.text = "Score: \(levelScore)"
        }
    }
    var totalScore:Int
    var timeRemaining:CGFloat{
        didSet{
            timeLabel.text = "Time Remaining: \(Int(timeRemaining))"
        }
    }
    
    
  
    let sceneManager:GameViewController
    var playableRect = CGRect.zero
    var totalSprites = 0
    var enemiesRemaining = 0
    
    let background = SKSpriteNode(imageNamed: "background")
    let timeLabel = SKLabelNode(fontNamed: "Futura")
    let scoreLabel = SKLabelNode(fontNamed: "Futura")
    let otherLabel = SKLabelNode(fontNamed: "Futura")
    let fireLabelLeft = SKSpriteNode(color: UIColor.black, size: CGSize(width: 300 , height: 200 ))
    let fireLabelRight = SKSpriteNode(color: UIColor.black, size: CGSize(width: 300 , height: 200 ))
    let gun = ShootingRifle()
    let reticule = TargetReticule()
    
    var lastUpdateTime: TimeInterval = 0
    var dt: TimeInterval = 0
    var spritesMoving = true
    
    // MARK -Initalization-
    
    init(size: CGSize, scaleMode: SKSceneScaleMode, levelNum:Int, totalScore:Int, levelTime:CGFloat, numEnemies: Int, sceneManager:GameViewController) {
        self.levelNum = levelNum
        self.totalScore = totalScore
        self.sceneManager = sceneManager
        self.timeRemaining = levelTime
        self.enemiesRemaining = numEnemies
        super.init(size: size)
        self.scaleMode = scaleMode
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        }
    
    
    
    override func didMove(to view: SKView) {
        setupUI()
        makeSprites(howMany: 10)
        unpauseSprites()
    }
    
    deinit{
        // TODO Clean up resources, timers, listeners, etc
    }
    
    private func setupUI(){
        
            playableRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            let fontSize = GameData.hud.fontSize
            let fontColor = GameData.hud.fontColorWhite
            let marginH = GameData.hud.marginH
            let marginV = GameData.hud.marginV
            
            backgroundColor = GameData.hud.backgroundColor
        
        // MARK: -level label -
            timeLabel.fontColor = fontColor
            timeLabel.fontSize = fontSize
            timeLabel.position = CGPoint(x: marginH,y: playableRect.maxY - marginV)
            timeLabel.verticalAlignmentMode = .top
            timeLabel.horizontalAlignmentMode = .left
            timeLabel.text = "Time Remaining: \(Int(timeRemaining))"
            addChild(timeLabel)
            
            scoreLabel.fontColor = fontColor
            scoreLabel.fontSize = fontSize
            scoreLabel.verticalAlignmentMode = .top
            scoreLabel.horizontalAlignmentMode = .left
            scoreLabel.text = "Score: 000"
            let scoreLabelWidth = scoreLabel.frame.size.width
            // here is the starting text of scoreLabel
            scoreLabel.text = "Score: \(levelScore)"
            scoreLabel.position = CGPoint(x: playableRect.maxX - scoreLabelWidth - marginH,y: playableRect.maxY - marginV)
            addChild(scoreLabel)
            
            otherLabel.fontColor = fontColor
            otherLabel.fontSize = fontSize
            otherLabel.position = CGPoint(x: marginH, y: playableRect.minY + marginV)
            otherLabel.verticalAlignmentMode = .bottom
            otherLabel.horizontalAlignmentMode = .left
            otherLabel.text = "Targets Remaining: 0"
            addChild(otherLabel)
        
            // MARK -Set up Fire buttons-
            fireLabelLeft.position = CGPoint(x: fireLabelLeft.size.width / 2, y: fireLabelLeft.size.height  )
            fireLabelLeft.name = "fireButton"
            fireLabelRight.position = CGPoint(x: playableRect.maxX - (fireLabelRight.size.width / 2), y: fireLabelLeft.size.height)
            fireLabelRight.name = "fireButton"
            addChild(fireLabelLeft)
            addChild(fireLabelRight)
        
            gun.position = CGPoint(x: playableRect.maxX / 2, y:  marginV)
            addChild(gun)
        
            reticule.position = CGPoint(x: playableRect.maxX  / 2, y: playableRect.maxY / 2)
            addChild(reticule)
        
            background.position = CGPoint(x: playableRect.maxX / 2, y: playableRect.maxY / 2)
            background.zPosition = -10
            addChild(background)
        }

    func makeSprites(howMany:Int) {
        totalSprites = totalSprites + howMany
        otherLabel.text = "Targets Remaining:\(totalSprites)"
        otherLabel.text = "Targets Remaining: 0"
        var s:Duck
        for _ in 0...howMany-1 {
            s = Duck()
            s.name = "diamond"
            s.position = randomCGPointInRect(playableRect, margin: 300)
            s.fwd = CGPoint(x: -1.0, y: 0)
            addChild(s)
        }
    }
    
    func calculateDeltaTime(currentTime: TimeInterval) {
        if lastUpdateTime > 0 {
            dt = currentTime - lastUpdateTime
        } else {
            dt = 0
        }
        lastUpdateTime = currentTime
    }
    
    func moveSprites(dt:CGFloat) {
        if spritesMoving {
            enumerateChildNodes(withName: "diamond", using: {
                node, stop in
                let s = node as! Duck
                let halfWidth = s.frame.width/2
                let halfHeight = s.frame.height/2
                
                s.update(dt:dt)
                
                // check left/right
                if s.position.x <= halfWidth || s.position.x >= self.size.width - halfWidth {
                    s.reflectX(screenWidth: self.size.width ) //bouncing
                    s.update(dt:dt) //extra move
                    // self.levelScore = self.levelScore + 1 // lame game
                    
                }
                
                // chech top/bottom
                if s.position.y <= self.playableRect.minY + halfHeight || s.position.y >= self.playableRect.maxY - halfHeight {
                    s.reflectY(screenHeight: self.playableRect.maxY )
                    s.update(dt: dt)
                    // self.levelScore = self.levelScore + 1
                }
            })
        }
    }
    
    func unpauseSprites() {
        let unpauseAction = SKAction.sequence([
            SKAction.wait(forDuration: 2),
            SKAction.run({self.spritesMoving = true})
            ])
        run(unpauseAction)
    }
    
    func createBullet(){
        let bullet = BulletSprite()
        let pos = reticule.position
        print("made a bullet")
        bullet.position = CGPoint(x: playableRect.maxX / 2, y: GameData.hud.marginV)
        
        
        // Bullet calculations
        let offset = pos - bullet.position
        
        //bail out if backwards 
        if(offset.y < 0 ){return}
        
        // add to view
        addChild(bullet)
        
        //get direction of where to shoot
        let direction = offset.normalized()
        
        // shoot far enough to cross screen
        let shootAmount = direction * 2500
        
        // add shoot amount to position
        let realDest = shootAmount + bullet.position
        
        
        let actionMove = SKAction.move(to: realDest, duration: 2)
        let actionMoveDone = SKAction.removeFromParent()
        let sequence = SKAction.sequence([actionMove, actionMoveDone])
        
        bullet.run(sequence)
        
    }
    
    // MARK: -Events-
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let location = touch.location(in: self)
        let touchedNode = self.nodes(at: location)
        
        if let name = touchedNode.first?.name {
            if name == "fireButton" {
                createBullet()
            }
        }
        
        if location.y > fireLabelLeft.position.y + 100{
            reticule.position = location
        }
        // createBullet(pos: location)
        /*
         if timeRemaining < 0 {
            //self.totalScore += self.levelScore
            let results = LevelResults(levelNum: levelNum, levelScore: levelScore, totalScore: totalScore, msg: "You finished level \(levelNum)")
            sceneManager.loadLevelFinishScene(results: results)
        } else {
            self.totalScore += self.levelScore
            let results = LevelResults(levelNum: levelNum, levelScore: levelScore, totalScore: totalScore, msg: "You finished level \(levelNum)")
            sceneManager.loadGameOverScene(results: results)
        }*/
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        let location = touch.location(in: self)
        reticule.position = location
    }
    
    // MARK: - Game Loop -
    override func update(_ currentTime: TimeInterval) {
        calculateDeltaTime(currentTime: currentTime)
        moveSprites(dt:CGFloat(dt))
        timeRemaining -= CGFloat(dt)
    }
}
