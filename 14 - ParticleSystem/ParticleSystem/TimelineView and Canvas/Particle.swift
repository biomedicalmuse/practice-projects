//
//  Particle.swift
//  ParticleSystem
//
//  Created by Natasha Godwin on 9/29/22.
//

import SwiftUI

/// A class that creates a single particle.
///
/// A class is more appropriate than a struct here because creating particles once and then
/// updating them every frame is better for performance than creating and re-creating them
/// from scratch.
/// Each particle has an id property because all particles will be stored in a set, so they can
/// be added and removed quickly and easily.
class Particle: Hashable, Equatable {
	let id = UUID()
	// Location
	var x: Double
	var y: Double
	// Movement
	var angle: Double
	var speed: Double
	// Appearance
	var scale: Double
	var opacity: Double
	// Lifetime
	var deathDate: Date
	// Behavior
	var rotation: Double
	var color: Color
	
	init(
		x: Double,
		y: Double,
		angle: Double,
		speed: Double,
		scale: Double,
		opacity: Double,
		deathDate: Date,
		rotation: Double,
		color: Color
	) {
		self.x = x
		self.y = y
		self.angle = angle
		self.speed = speed
		self.scale = scale
		self.opacity = opacity
		self.deathDate = deathDate
		self.rotation = rotation
		self.color = color
	}
	
	static func ==(lhs: Particle, rhs: Particle) -> Bool {
		 lhs.id == rhs.id
	}

	func hash(into hasher: inout Hasher) {
		 hasher.combine(id)
	}
}

