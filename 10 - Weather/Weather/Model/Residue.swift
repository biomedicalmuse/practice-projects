//
//  Residue.swift
//  Weather
//
//  Created by Natasha Godwin on 9/19/22.
//

import SwiftUI

/// A class that contains a set of residue drops. Used to create a splash effect when the user scrolls.
///
/// Rather than actually making rain hit the UI and bounce off, this just creates new rain particles at random intervals.
/// When the two effects are combined in ContentView -- the falling rain or snow from Storm and the residue particles in this class -- the user's brain
/// connects the two.
class Residue {
	 var drops = Set<ResidueDrop>()
	 var lastUpdate = Date.now
	 var nextCreationTime = Date.now

	// This will always be set to snow because it looks good for both rain and snow.
	 let image = Image("snow")
	 let type: Storm.Contents

	 let creationAmount: Int
	 let lifetime: ClosedRange<Double>
	 let creationDelay: ClosedRange<Double>?
	
	init(type: Storm.Contents, strength: Double) {
		 self.type = type

		 switch type {
		 case .snow:
			  creationAmount = 1 // particle
			  lifetime = 1.0...2.0
		 default:
			  creationAmount = 3 // particles
			  lifetime = 0.9...1.1
		 }

		 // Delay the creation of each particle based on the storm's intensity
		if type == .none || strength == 0 {
			 creationDelay = nil
		} else {
			 switch strength {
			 case 1...200:
				  creationDelay = 0...0.25
			 case 201...400:
				  creationDelay = 0...0.1
			 case 401...800:
				  creationDelay = 0...0.05
			 default:
				  creationDelay = 0...0.02
			 }
		}
	}
	
	func update(date: Date, size: CGSize) {
		 // don't run any of this code if we aren't creating particles
		 guard let creationDelay = creationDelay else { return }

		 let currentTime = date.timeIntervalSince1970
		 let delta = currentTime - lastUpdate.timeIntervalSince1970
		 let divisor = size.height / size.width

		// Loop over every residue drop and update its position.
		// 1. Increase Y movement based on the time delta.
		// 2. If the drop falls below the halfway point vertically, stop it or make it "fall off" the edge
		// 3. If the current time exceeds the destruction time, destroy it.
		// 4. If the current time exceeds the nextCreationTime, simulate rain splashes and create new particles.
		for drop in drops {
			 drop.x += drop.xMovement * drop.speed * delta * divisor
			 drop.y += drop.yMovement * drop.speed * delta
			 drop.yMovement += delta * 2

			 if drop.y > 0.5 {
				  if drop.x > 0.075 && drop.x < 0.925 {
						drop.y = 0.5
						drop.yMovement = 0
				  }
			 }

			 if drop.destructionTime < currentTime {
				  drops.remove(drop)
			 }
			
			if nextCreationTime.timeIntervalSince1970 < currentTime {
				 let dropX = Double.random(in: 0.075...0.925)

				 for _ in 0..<creationAmount {
					  drops.insert(ResidueDrop(type: type, xPosition: dropX, destructionTime: currentTime + .random(in: lifetime)))
				 }

				 nextCreationTime = Date.now + Double.random(in: creationDelay)
			}
			
			lastUpdate = date

		}
	}
	
}

