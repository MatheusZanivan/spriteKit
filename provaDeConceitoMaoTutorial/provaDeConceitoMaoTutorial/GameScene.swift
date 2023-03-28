//
//  GameScene.swift
//  provaDeConceitoMaoTutorial
//
//  Created by Matheus Zanivan on 22/03/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
	var lastInteraction : TimeInterval = 0
	
	
	var alimento = SKSpriteNode(imageNamed: "carne")
	var alimento2 = SKSpriteNode(imageNamed: "rosquinha")
	var alimento3 = SKSpriteNode(imageNamed: "tortinha")
	let personagem = SKSpriteNode(imageNamed: "dinossauro")
	let personagem2 = SKSpriteNode(imageNamed: "dinossauro2")
	let maoTutorial = SKSpriteNode(imageNamed: "mao")
	
	
	
	override func didMove(to view: SKView) {
		let posicaoMao = randomObject()
		
		
		alimento.position = CGPoint(x: self.size.width/1.5, y: self.size.height/1.5)
		alimento2.position = CGPoint(x: self.size.width/3, y: self.size.height/1.5)
		alimento3.position = CGPoint(x: self.size.width/2, y: self.size.height/1.3)
		personagem.position = CGPoint(x: self.size.width/2, y: self.size.height/3.5)
		maoTutorial.position = CGPoint(x: posicaoMao.position.x, y: posicaoMao.position.y)
		self.backgroundColor = .white
		
		alimento.size = CGSize(width: self.size.width/15, height: self.size.height/10)
		alimento2.size = CGSize(width: self.size.width/15, height: self.size.height/10)
		alimento3.size = CGSize(width: self.size.width/15, height: self.size.height/10)
		personagem.size = CGSize(width: self.size.width/10, height: self.size.height/5)
		maoTutorial.size = CGSize(width: self.size.width/15, height: self.size.height/10)
		
		maoTutorial.zPosition = 1
		
		
		self.addChild(alimento)
		self.addChild(alimento2)
		self.addChild(alimento3)
		self.addChild(personagem)
		self.addChild(maoTutorial)
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		lastInteraction = CACurrentMediaTime()
	}
	override func update(_ currentTime: TimeInterval) {
		
		 
		let timeSinceLastInteraction = currentTime - lastInteraction
		if timeSinceLastInteraction < currentTime{
			print("Palmeiras \(currentTime)")
		}
	}
	func moveHand(initialPos: CGPoint, destinationPos: CGPoint){
		let maoMagica = SKAction.move(to: CGPoint(x: destinationPos.x, y: destinationPos.y), duration: 1.5)
		maoTutorial.run(maoMagica)
	}
	
	func randomObject() -> SKSpriteNode{
		let arr:[SKSpriteNode] = [alimento,alimento2,alimento3]
		return arr.randomElement() ?? SKSpriteNode(imageNamed: "Failed")
	}
}

