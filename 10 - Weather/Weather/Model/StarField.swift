//
//  StarField.swift
//  Weather
//
//  Created by Natasha Godwin on 9/15/22.
//

import Foundation


/// A class that creates 200 stars and places them on the screen.
///
/// Stars will appear from -50 to 500 on the x-axis and from 0 to 600 on the y-axis to accomodate different screen sizes.
class StarField {
	var stars = [Star]()
	var leftEdge = -50.0
	var rightEdge = 500.0
	var lastUpdate = Date.now
	
	init() {
		for _ in 1...200 {
			let x = Double.random(in: leftEdge...rightEdge)
			let y = Double.random(in: 0...600)
			let size = Double.random(in: 1...3)
			let star = Star(x: x, y: y, size: size)
			stars.append(star)
		}
	}
	
	/// A method that moves the star field gradually toward the left over time, to create the illusion that the world is spinning.
	/// - Parameter date: a Date
	func update(date: Date) {
		 let delta = date.timeIntervalSince1970 - lastUpdate.timeIntervalSince1970

		 for star in stars {
			  star.x -= delta * 2

			  if star.x < leftEdge {
					star.x = rightEdge
			  }
		 }

		 lastUpdate = date
	}
}
