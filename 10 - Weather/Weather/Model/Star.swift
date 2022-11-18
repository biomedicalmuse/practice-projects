//
//  Star.swift
//  Weather
//
//  Created by Natasha Godwin on 9/15/22.
//

import Foundation


/// A class that creates a single star. 
class Star {
	var x: Double
	var y: Double
	var size: Double
	var flickerInterval: Double // tracks how fast a star should flicker
	
	init(x: Double, y: Double, size: Double) {
	  self.x = x
	  self.y = y
	  self.size = size
		
	  // Large stars near the top of the sky will glow.
	  if size > 2 && y < 250 {
			 flickerInterval = Double.random(in: 3...20)
		} else {
			 flickerInterval = 0
		}
	}
}
