//
//  GameScene.swift
//  Animaca1
//
//  Created by Matheus Zanivan on 21/03/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
	
	
	override func didMove(to view: SKView) {
		
		
	}
	//rotina para ativar a animacao:
	func createTexture(_ name:String) -> [SKTexture]{
		let textureAtlas = SKTextureAtlas(named: name)
		var frames = [SKTexture]()
		for i in 0...textureAtlas.textureNames.count - 1{
			frames.append(textureAtlas.textureNamed(textureAtlas.textureNames[i]))
		}
		return frames
	}
	
	
	func touchDown(atPoint pos : CGPoint) {
		let monster = SKSpriteNode(imageNamed: "monster1.png")
		monster.position = pos
		addChild(monster)
		
		let frames:[SKTexture] = createTexture("Sprites")
		monster.run(SKAction.repeat(SKAction.animate(with: frames,
													 timePerFrame: TimeInterval(0.5),
													 resize: false, restore: true), count: 3))
		
	}
	
	func touchMoved(toPoint pos : CGPoint) {
		
	}
	
	func touchUp(atPoint pos : CGPoint) {
		
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		for t in touches { self.touchDown(atPoint: t.location(in: self))}
		
	}
}
