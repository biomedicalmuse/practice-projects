//
//  Lightning.swift
//  Weather
//
//  Created by Natasha Godwin on 9/20/22.
//

import SwiftUI

/// A class that creates multiple lightning bolts.
///
/// Each lightning bolt will have one of three states: waiting, striking, or fading.
class Lightning {
	enum LightningState {
		case waiting, preparing, striking, fading
	}
	
	var bolts = [LightningBolt]()
	var state = LightningState.waiting
	var lastUpdate = Date.now
	var flashOpacity = 0.0 // tracks how bright the flash is
	
	// For customization
	var maximumBolts: Int
	var forkProbability: Int
	
	init(maximumBolts: Int, forkProbability: Int) {
		 self.maximumBolts = maximumBolts
		 self.forkProbability = forkProbability
	}
	
	/// A method that animates the lightning effect over time.
	/// - Parameters:
	///   - date: the current date
	///   - size: the size of the canvas
	func update(date: Date, in size: CGSize) {
		 let delta = date.timeIntervalSince1970 - lastUpdate.timeIntervalSince1970
		 lastUpdate = date

		 switch state {
		 case .waiting:
			  break
			 
		 case .preparing:
			 // Pick a random site position to strike
			  let startPosition = CGPoint(x: Double.random(in: 50...size.width - 50), y: 0)
			  let newBolt = LightningBolt(start: startPosition, width: 5, angle: Angle.degrees(270).radians)
			  bolts.append(newBolt)
			  state = .striking

		 case .striking:
			  // Calculate the bolt's speed
			 let speed = delta * 800
			 
			 // Assume that the bolt has hit the ground.
			 var hasFinishedStriking = true
			 
			 // Add five line segments to every update
			 for bolt in bolts {
				  guard var lastPoint = bolt.points.last else { continue }

				  for _ in 0..<5 {
					  /*
						Each one of our lightning bolts has its own angle,
						so if we calculate the sine and cosine of that and
						multiply by our speed constant we can figure out the new
						end point for the line and add it to the other points.
						
						We're adding randomness here, so it doesn't go straight down.
						*/
					  let endX = lastPoint.x + (speed * cos(bolt.angle) + Double.random(in: -10...10))
					  let endY = lastPoint.y - (speed * sin(bolt.angle) + Double.random(in: -10...10))
					  lastPoint = CGPoint(x: endX, y: endY)
					  bolt.points.append(lastPoint)
					  
				  }
				 
				 if lastPoint.y < size.height {
					  hasFinishedStriking = false
				 }
				 
				 if hasFinishedStriking {
					  state = .fading
					  flashOpacity = 0.6

					 /*
					  Increase the width of the bolt
					  to create a flash effect
					  */
					 for bolt in bolts {
							bolt.width *= 1.1
					  }
				 }
				 
				 /*
				  Make the lightning fork 20% of the time,
				  if there aren't too many bolts.
				  
				  Forks will be a 90-degree cone, moving straight down,
				  and be 75% slimmer than the main bolt.
				  */
				 if bolts.count < maximumBolts && Int.random(in: 0..<100) <= forkProbability {
					  let newAngle = Double.random(in: -.pi / 4 ... .pi / 4) - .pi / 2
					  let newBolt = LightningBolt(start: lastPoint, width: bolt.width * 0.75, angle: newAngle)
					  bolts.append(newBolt)
				 }
			 }

		 case .fading:
			  var allFaded = true
			  flashOpacity -= delta

			  for bolt in bolts {
					bolt.width -= delta * 15

					if bolt.width > 0.05 {
						 allFaded = false
					}
			  }

			  if allFaded && flashOpacity <= 0 {
					bolts.removeAll(keepingCapacity: true)
					state = .waiting
			  }
		 }
	}
	
	func strike() {
		guard state == .waiting else { return }
		state = .preparing
	}
	
	
}
