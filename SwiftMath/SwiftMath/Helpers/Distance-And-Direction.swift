//
//  Trig-Functions.swift
//  SwiftMath
//
//  Created by Natasha Godwin on 4/2/22.
//

import Foundation
import SwiftUI
import CoreGraphics

/*
 
 Thank you to SwiftUI Lab for this function and crash course on trigonometry.
 Source: https://swiftui-lab.com/trigonometric-recipes-for-swiftui/
 */

func getDistanceAndDirection(
	firstPoint: CGPoint,
	secondPoint: CGPoint)
	-> (distance: CGFloat, angle: Angle) {
	
		let legA = secondPoint.y - firstPoint.y
		let legB = secondPoint.x - firstPoint.x
		
		// Calculate angle
		var alpha = atan2(legA, legB)
		// Get sine of the angle
		let sine = sin(alpha)
		// Calculate hypotenuse and prevent divide by zero
		let hypotenuse = (legA == 0 ? abs(legB) : (legA / sine ))
		
		// Make sure angles are returned as positive values
		alpha = alpha < 0 ? alpha + (.pi * 2) : alpha
		
		return (hypotenuse, Angle(radians: Double(alpha)))
}




