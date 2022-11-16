//
//  ClockTime.swift
//  AdvancedAnimations
//
//  Created by Natasha Godwin on 11/15/22.
//

import SwiftUI

/// A struct that represents time in hours, minutes, and seconds
struct ClockTime {
	var hours: Int
	var minutes: Int
	var seconds: Double
	
	// Standard initializer
	init(hours: Int, minutes: Int, seconds: Double) {
		self.hours = hours
		self.minutes = minutes
		self.seconds = seconds
	}
	
	// Initializer, with total number of seconds for each unit
	init(seconds: Double) {
		let hours = Int(seconds) / 3600
		let minutes = (Int(seconds) - (hours * 3600)) / 60
		let seconds = seconds - Double((hours * 3600) + (minutes * 60))
		
		self.hours = hours
		self.minutes = minutes
		self.seconds = seconds
	}
	
	// Compute the number of seconds
	var asSeconds: Double {
		return Double(self.hours * 3600) + Double(self.minutes * 60) + self.seconds

	}
	
	// Show as string
	func asString() -> String {
		return self.hours.formatted(.number) + ":" + self.minutes.formatted(.number) + ":" + self.seconds.formatted(.number)
	}
}

// Conform to VectorArithmetic, so the clock can be animated
extension ClockTime: VectorArithmetic {
	static var zero: ClockTime {
		return ClockTime(hours: 0, minutes: 0, seconds: 0)
	}
	
	var magnitudeSquared: Double { return asSeconds * asSeconds }
		 
		 static func -= (lhs: inout ClockTime, rhs: ClockTime) {
			  lhs = lhs - rhs
		 }
		 
		 static func - (lhs: ClockTime, rhs: ClockTime) -> ClockTime {
			 return ClockTime(seconds: lhs.asSeconds - rhs.asSeconds)
		 }
		 
		 static func += (lhs: inout ClockTime, rhs: ClockTime) {
			  lhs = lhs + rhs
		 }
		 
		 static func + (lhs: ClockTime, rhs: ClockTime) -> ClockTime {
			 return ClockTime(seconds: lhs.asSeconds + rhs.asSeconds)
		 }
		 
		 mutating func scale(by rhs: Double) {
			  var seconds = Double(self.asSeconds)
			  seconds.scale(by: rhs)
			  
			  let count = ClockTime(seconds: seconds)
			  self.hours = count.hours
			  self.minutes = count.minutes
			  self.seconds = count.seconds
		 }
	
}
