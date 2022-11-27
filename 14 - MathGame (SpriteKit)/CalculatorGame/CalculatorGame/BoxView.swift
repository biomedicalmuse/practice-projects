//
//  BoxView.swift
//  CalculatorGame
//
//  Created by Natasha Godwin on 11/27/22.
//

import SwiftUI
import SpriteKit

struct BoxView: View {
	var scene: SKScene {
		let scene = GameScene()
		scene.size = CGSize(width: 64, height: 64)
		scene.scaleMode = .fill
		scene.boxNumber = index
		scene.fontColor = color
		return scene
	}
	
	@State var index: Int
	@State var color: UIColor
	
    var body: some View {
		 ZStack {
			 SpriteView(scene: scene)
				 .frame(width: 64, height: 64)
				 .ignoresSafeArea()
			 Circle()
				 .stroke(Color.white, lineWidth: 4)
		 }
    }
}

struct BoxView_Previews: PreviewProvider {
    static var previews: some View {
		 BoxView(index: 10, color: UIColor(Color.black))
    }
}
