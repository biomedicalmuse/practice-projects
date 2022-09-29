//
//  ParticleSystem.swift
//  ParticleSystem
//
//  Created by Natasha Godwin on 9/29/22.
//

import SwiftUI

/// A class that creates and manages particles
class ParticleSystem: ObservableObject {
	let image = Image("line")
	var particles = Set<Particle>()
	var lastUpdate = Date()
	var lastCreationDate = Date()
	
	@Published var xPosition = 50.0
	@Published var yPosition = 0.0
	@Published var xPositionRange = 100.0
	@Published var yPositionRange = 0.0

	@Published var angle = 90.0
	@Published var angleRange = 5.0

	@Published var speed = 50.0
	@Published var speedRange = 25.0
	
	@Published var opacity = 50.0
	@Published var opacityRange = 50.0
	@Published var opacitySpeed = -10.0

	@Published var scale = 100.0
	@Published var scaleRange = 50.0
	@Published var scaleSpeed = 10.0
	
	@Published var birthRate = 10.0 // how fast to create particles
	@Published var lifetime = 500.0 // how long they should live
	@Published var lifetimeRange = 25.0 // the range of how long they should live 
	
	/// A method that accepts the current date and adds a new particle every time it's called.
	/// - Parameter date: the current date
	func update(date: Date) {
		// Calculate the amount of time that's passed.
		let elapsedTime = date.timeIntervalSince1970 - lastUpdate.timeIntervalSince1970
		lastUpdate = date
		
		for particle in particles {
			// Remove particles that have "died"
			if particle.deathDate < date {
				 particles.remove(particle)
				 continue
			}
			
			// Calculate where each particle needs to move.
			particle.x += cos(particle.angle) * particle.speed / 100 * elapsedTime
			particle.y += sin(particle.angle) * particle.speed / 100 * elapsedTime
			
			// Adjust the scale and opacity over time.
			particle.scale += scaleSpeed / 50 * elapsedTime
			particle.opacity += opacitySpeed / 50 * elapsedTime
		}
		
		/*
		 Create particles by ...
		 1. Figuring out how often to create particles
		 2. Tracking how much time has elapsed since a particle was last created
		 3. Using those values to calculate how many particles to create
		 */
		let birthSpeed = 1 / birthRate
		let elapsedSinceCreation = date.timeIntervalSince1970 - lastCreationDate.timeIntervalSince1970
		let amountToCreate = Int(elapsedSinceCreation / birthSpeed)
		for _ in 0..<amountToCreate {
			 particles.insert(createParticle())
			 lastCreationDate = date
		}
	}
	
	/// A method that creates and returns one particle.
	/// - Returns: one particle
	///
	/// The X and Y coordinates are between 0 and 1 because they will be scaled
	/// based on the amount of space available on the screen, so the particle system
	/// will work well across devices and orientations.
	private func createParticle() -> Particle {
		let angleDegrees = angle + Double.random(in: -angleRange / 2...angleRange / 2)
		let angleRadians = angleDegrees * .pi / 180
		
		 return Particle(
			x: xPosition / 100 + Double.random(in: -xPositionRange / 200...xPositionRange / 200),
			y: yPosition / 100 + Double.random(in: -yPositionRange / 200...yPositionRange / 200),
			angle: angleRadians,
			speed: speed + Double.random(in: -speedRange / 2...speedRange / 2),
			scale: scale / 100 + Double.random(in: -scaleRange / 200...scaleRange / 200),
			opacity: opacity / 100 + Double.random(in: -opacityRange / 200...opacityRange / 200),
			deathDate: Date() + lifetime / 100 + Double.random(in: -lifetimeRange / 200...lifetimeRange / 200)
		 )
	}
}
