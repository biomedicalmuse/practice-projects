//
//  Cloud.swift
//  Weather
//
//  Created by Natasha Godwin on 1/16/22.
//

import SwiftUI

class Cloud {
	var position: CGPoint
	let imageNumber: Int
	let speed = Double.random(in: 4...12)
	let scale: Double
	
	init(imageNumber: Int, scale: Double) {
		self.imageNumber = imageNumber
		self.scale = scale
		
		let startX = Double.random(in: -400...400)
		let startY = Double.random(in: -50...200)
	   position = CGPoint(x: startX, y: startY)
	}
	
	enum Thickness: CaseIterable {
		case none
		case thin
		case light
		case regular
		case thick
		case ultra
	}
}
