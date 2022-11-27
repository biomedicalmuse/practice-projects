//
//  GameScene.swift
//  CalculatorGame
//
//  Created by Natasha Godwin on 11/27/22.
//

import SwiftUI
import SpriteKit
import Combine

let mySignal = PassthroughSubject<String, Never>()

class GameScene: SKScene {
	var boxNumber: Int!
	var scoreLabel: SKLabelNode!
	var fontColor: UIColor!
	
	 override func didMove(to view: SKView) {
		 scoreLabel = SKLabelNode(fontNamed: "Futura-CondensedExtraBold")
			  scoreLabel.text = String(boxNumber)
			  scoreLabel.horizontalAlignmentMode = .center
			  scoreLabel.position = CGPoint(x: 32, y: 20)
			  scoreLabel.fontColor = fontColor
			  addChild(scoreLabel)
	 }

	// Make the background red whenever the box is touched
	 override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		 guard let touch = touches.first else { return }
		 
		 if touch.view == self.view {
			 self.view?.scene?.backgroundColor = UIColor.blue
			 print("You touched ", boxNumber!)
			 mySignal.send(String(boxNumber))
		 } else {
			 return
		 }
	 }
	
	// Turn the background black whenever the touch ends
	override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
		 guard let touch = touches.first else { return }
		 if touch.view == self.view {
			self.view?.scene?.backgroundColor = UIColor.black
		 } else {
			return
		}
	}
}
