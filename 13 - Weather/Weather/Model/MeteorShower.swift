//
//  MeteorShower.swift
//  Weather
//
//  Created by Natasha Godwin on 9/22/22.
//

import SwiftUI

/// A class that contains a set of meteors that are created at random intervals
class MeteorShower {
	 var meteors = Set<Meteor>()
	 var lastUpdate = Date.now

	 var lastCreationDate = Date.now
	 var nextCreationDelay = Double.random(in: 5...10)
	
	/// A method that creates a meteor on the left or right hand side of the screen
	/// - Parameter size: the size of the screen
	func createMeteor(in size: CGSize) {
		 let meteor: Meteor

		 if Bool.random() {
			  meteor = Meteor(x: 0, y: Double.random(in: 100...200), isMovingRight: true)
		 } else {
			  meteor = Meteor(x: size.width, y: Double.random(in: 100...200), isMovingRight: false)
		 }

		 meteors.insert(meteor)
		 lastCreationDate = .now
		 nextCreationDelay = Double.random(in: 5...10)
	}
	
	/// A method that controls how a meteor moves in a set based on its initial position
	/// - Parameters:
	///   - date: a date
	///   - size: the size of the canvas
	func update(date: Date, size: CGSize) {
		 let delta = date.timeIntervalSince1970 - lastUpdate.timeIntervalSince1970

		 if lastCreationDate + nextCreationDelay < .now {
			  createMeteor(in: size)
		 }

		 // Update all meteors
		for meteor in meteors {
			// Adjust the meteor's position on the x-axis based on where it's moving
			 if meteor.isMovingRight {
				  meteor.x += delta * meteor.speed
			 } else {
				  meteor.x -= delta * meteor.speed
			 }

			 meteor.speed -= delta * 900

			// Remove the meteor from the set, if speed = 0
			// Otherwise, make it longer
			if meteor.speed < 0 {
				  meteors.remove(meteor)
			 } else if meteor.length < 100 {
				  meteor.length += delta * 300
			 }
		}



		 lastUpdate = date
	}
}
