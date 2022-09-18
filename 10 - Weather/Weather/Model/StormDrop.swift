//
//  StormDrop.swift
//  Weather
//
//  Created by Natasha Godwin on 9/18/22.
//

import SwiftUI

/// A class that contains a single drop of rain or snow.
///
/// Each storm drop is a value between 0 and 1, where 0 is the left or top edge and 1 is the bottom or right edge.
class StormDrop {
	// Location
	var x: Double
	var y: Double
	
	// Size
	var xScale: Double
	var yScale: Double
	
	// Speed
	var speed: Double
	
	// Visibility
	var opacity: Double
	
	// Angles
	var direction: Angle
	var rotation: Angle
	var rotationSpeed: Angle
	
	/*
	 Given all of these properties, we're only initializing the most essential,
	 and letting the computer figure out the rest.
	 
	 All of the numbers here were discovered through trial and error. 
	 */
	init(type: Storm.Contents, direction: Angle) {
		 if type == .snow {
			  self.direction = direction + .degrees(.random(in: -15...15))
		 } else {
			  self.direction = direction
		 }

		 x = Double.random(in: -0.2...1.2)
		 y = Double.random(in: -0.2...1.2)

		 switch type {
		 case .snow:
			  xScale = Double.random(in: 0.125...1)
			  yScale = xScale * Double.random(in: 0.5...1)
			  speed = Double.random(in: 0.2...0.6)
			  opacity = Double.random(in: 0.2...1)
			  rotation = Angle.degrees(Double.random(in: 0...360))
			  rotationSpeed = Angle.degrees(Double.random(in: -360...360))
		 default:
			  xScale = Double.random(in: 0.4...1)
			  yScale = xScale
			  speed = Double.random(in: 1...2)
			  opacity = Double.random(in: 0.05...0.3)
			  rotation = Angle.zero
			  rotationSpeed = Angle.zero
		 }
	}
}
