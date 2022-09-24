//
//  Storm.swift
//  Weather
//
//  Created by Natasha Godwin on 9/18/22.
//

import SwiftUI

/// A class that contains a rain or snow storm.
class Storm {
	enum Contents: CaseIterable {
		case none, rain, snow
	}
	
	var drops = [StormDrop]()
	var lastUpdate = Date.now
	var image: Image
	
	
	init(type: Contents, direction: Angle, strength: Int) {
		 switch type {
		 case .snow:
			  image = Image("snow")
		 default:
			  image = Image("rain")
		 }

		 for _ in 0..<strength {
			 /*
			  When an angle is zero, the image will appear on the right.
			  To make sure it goes straight down as expected, we're adding 90 degrees.
			  */
			  drops.append(StormDrop(type: type, direction: direction + .degrees(90)))
		 }
	}
	
	func update(date: Date, size: CGSize) {
		 let delta = date.timeIntervalSince1970 - lastUpdate.timeIntervalSince1970
		// Makes sure particles move equally vertically and horizontally
		let divisor = size.height / size.width

		  for drop in drops {
			  
			  /*
				1. Convert the angle into actual movements along the X and Y axis
				
				To do this, we'll apply sine and cosine functions to our angle
				in radians to figure out the Y and X values, respectively.
				
				*/
				let radians = drop.direction.radians
			   drop.x += cos(radians) * drop.speed * delta * divisor
				drop.y += sin(radians) * drop.speed * delta
			  
			  // 2. Wrap the particles when they travel off-screen
			  if drop.x < -0.2 {
					drop.x += 1.4
			  }

			  if drop.y > 1.2 {
					drop.x = Double.random(in: -0.2...1.2)
					drop.y -= 1.4
			  }

			  drop.rotation += drop.rotationSpeed * delta
			}

		 lastUpdate = date
	}
	
	
}
