//
//  Polygon.swift
//  AdvancedAnimations
//
//  Created by Natasha Godwin on 11/15/22.
//

import SwiftUI

/// A struct that creates a polygon with any number of sides
///
/// To animate changes, we have to teach SwiftUI how to draw
/// a polygon with a non-integer number of sides. That's because
/// behind the scenes, SwiftUI handles changes from one value to
/// the next incrementally. So, changing a 3-sided polygon to a 4-sided
/// one will move from 3.0, 3.12, 3.35, and so on.
///
/// Shape already conforms to the Animatable protocol, so all we have to
/// do is represent the number of sides as a double internally and write a
/// computed property the handles updates.
struct Polygon: Shape {
   var sides: Int
	private var sidesAsDouble: Double
	var scale: Double
	
	var animatableData: AnimatablePair<Double, Double> {
		get { return AnimatablePair(sidesAsDouble, scale) }
		set {
			sidesAsDouble = newValue.first
			scale = newValue.second
		}
	}
	
	init(sides: Int, scale: Double) {
		self.sides = sides
		self.sidesAsDouble = Double(sides)
		self.scale = scale
	}
	
	func path(in rect: CGRect) -> Path {
		let hypotenuse = Double(min(rect.size.width, rect.size.height)) / 2 * scale
		let center = CGPoint(x: rect.size.width / 2.0, y: rect.size.height / 2.0)
		var path = Path()
		
		let extra: Int = sidesAsDouble != Double(Int(sidesAsDouble)) ? 1:0
		
		for i in 0..<Int(sidesAsDouble) + extra {
			let angle = (Double(i) * (360.0 / Double(sidesAsDouble))) * Double.pi / 180
			
			// Calculate the position of the vertex
			let point = CGPoint(
				x: center.x + CGFloat(cos(angle) * hypotenuse),
				y: center.y + CGFloat(sin(angle) * hypotenuse)
			)
			
			if i == 0 {
				// Move to the first corner
				path.move(to: point)
			} else {
				// Draw a line to the next corner
				path.addLine(to: point)
			}
		}
		
		path.closeSubpath()
		return path
	}
}


