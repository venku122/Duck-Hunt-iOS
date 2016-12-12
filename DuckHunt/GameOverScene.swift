import SpriteKit
class GameOverScene: SKScene, SKTGameControllerDelegate {
    // MARK: - ivars -
    let sceneManager:GameViewController
    let results:LevelResults
    let button:SKLabelNode = SKLabelNode(fontNamed: GameData.font.mainFont)
    let background = SKSpriteNode(imageNamed: "endLevel")
    
    // MARK: - Initialization -
    init(size: CGSize, scaleMode:SKSceneScaleMode, results: LevelResults,sceneManager:GameViewController) {
        self.results = results
        self.sceneManager = sceneManager
        super.init(size: size)
        self.scaleMode = scaleMode
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle -
    override func didMove(to view: SKView){
        let playableRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        backgroundColor = GameData.scene.backgroundColor
        
        let label = SKLabelNode(fontNamed: GameData.font.mainFont)
        label.text = "Game Over"
        label.fontSize = 100
        label.position = CGPoint(x:size.width/2, y:size.height/2 + 300)
        addChild(label)
        
        let label2 = SKLabelNode(fontNamed: GameData.font.mainFont)
        label2.text = results.msg
        label2.fontSize = 70
        label2.position = CGPoint(x:size.width/2, y:size.height/2 + 100)
        addChild(label2)
        
        let label3 = SKLabelNode(fontNamed: GameData.font.mainFont)
        label3.text = "You got \(results.totalScore) points!"
        label3.fontSize = 70
        label3.position = CGPoint(x:size.width/2, y:size.height/2 - 100)
        addChild(label3)
        
        let label4 = SKLabelNode(fontNamed: GameData.font.mainFont)
        label4.text = "Tap or press A to return Home!"
        label4.fontColor = UIColor.red
        label4.fontSize = 70
        label4.position = CGPoint(x:size.width/2, y:size.height/2 - 400)
        addChild(label4)
        
        background.position = CGPoint(x: playableRect.maxX / 2, y: playableRect.maxY / 2)
        background.zPosition = -10
        addChild(background)
        SKTGameController.sharedInstance.delegate = self
    }
    
    
    // MARK: - Events -
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        sceneManager.loadHomeScene()
        
    }
    
    // MARK: - SKTGameControllerDelegate
    // call by "A" button
    func buttonEvent(event: String, velocity: Float, pushedOn: Bool) {
        
        if pushedOn == false {
            
            print("button released")
            sceneManager.loadHomeScene()
        }
    }
    
    func stickEvent(event: String, point: CGPoint) {
        
    }
}
