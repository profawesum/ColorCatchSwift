//
//  MainMenuScene.swift
//  CatcherOfTheColor
//
//  Created by Harrison Orsbourne on 30/09/19.
//  Copyright © 2019 Harrison Orsbourne. All rights reserved.
//

import SpriteKit

class MainMenu: SKScene{
    
    var square = SKSpriteNode()
    let left = SKSpriteNode();
    let right = SKSpriteNode()
    var titleLabel : SKLabelNode!
    var playLabel : SKLabelNode!
    var scoreLabel : SKLabelNode!
    var highScoreLabel : SKLabelNode!
    
    
    override func didMove(to view: SKView) {
        
        //user defaults store values
        let Score = UserDefaults.standard.integer(forKey: "PreviousScore")
        var highScore = UserDefaults.standard.integer(forKey: "HighScore");
        
        
        //player sprite
        square = SKSpriteNode(texture: SKTexture(imageNamed: "ColorWheel"), size: CGSize(width: 200, height: 200))
        square.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 140)
        square.color = UIColor.blue;
        self.addChild(square)
        
        // making the title label
        titleLabel = SKLabelNode();
        titleLabel.text = "Color Catch"
        titleLabel.fontSize = 68.0
        titleLabel.fontName = "AvenirNext-Bold"
        titleLabel.fontColor = UIColor.white
        titleLabel.position = CGPoint(x : self.frame.midX, y: self.frame.midY*1.75)
        self.addChild(titleLabel);
        
        playLabel = SKLabelNode();
        playLabel.text = "Play"
        playLabel.fontSize = 68.0
        playLabel.fontName = "AvenirNext-Bold"
        playLabel.fontColor = UIColor.white
        playLabel.position = CGPoint(x : self.frame.midX, y: self.frame.midY*1.25)
        self.addChild(playLabel);
        
        
        scoreLabel = SKLabelNode();
        scoreLabel.text = "Last Score: \(Score)"
        scoreLabel.fontSize = 32.0
        scoreLabel.fontName = "AvenirNext-Bold"
        scoreLabel.fontColor = UIColor.white
        scoreLabel.position = CGPoint(x : self.frame.midX, y: self.frame.midY/1.5)
        self.addChild(scoreLabel);
        
        
        if Score > highScore{
            highScore = Score;
        }
        UserDefaults.standard.set(highScore, forKey: "HighScore")
        
        highScoreLabel = SKLabelNode();
        highScoreLabel.text = "High Score: \(highScore)"
        highScoreLabel.fontSize = 32.0
        highScoreLabel.fontName = "AvenirNext-Bold"
        highScoreLabel.fontColor = UIColor.white
        highScoreLabel.position = CGPoint(x : self.frame.midX, y: self.frame.midY/3.0)
        self.addChild(highScoreLabel);
        
        
        self.backgroundColor = UIColor.black

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first?.location(in: self)
        if(playLabel.contains(location!)){
            let newScene = GameScene(size:(self.view?.bounds.size)!)
            let transition = SKTransition.reveal(with: .down, duration: 2)
            self.view?.presentScene(newScene, transition: transition)
            transition.pausesOutgoingScene = true
            transition.pausesIncomingScene = false
    }
}
}
