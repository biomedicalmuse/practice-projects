//
//  Polygon.swift
//  SwiftMath
//
//  Created by Natasha Godwin on 4/2/22.
//

import SwiftUI

struct Polygon: Shape {
	var sides: Int
	
	func path(in rectangle: CGRect) -> Path {
		// The hypotenuse will fit inside the available rectangle
		let hypotenuse = Double(min(rectangle.size.width, rectangle.size.height)) / 2.0
		
		// Calculates the center
		let center = CGPoint(
			x: rectangle.size.width / 2.0,
			y: rectangle.size.height / 2.0
		)
		
		var path = Path()
		
		for i in 0..<sides {
			let angle = (Double(i) * (360.0 / Double(sides))) * Double.pi / 180
			
			// Calculate vertex position
			let point = CGPoint(
				x: center.x + CGFloat(cos(angle) * hypotenuse),
				y: center.y + CGFloat(sin(angle) * hypotenuse)
			)
			
			if i == 0 {
				// Move to the first vertex
				path.move(to: point)
			} else {
				// Draw line to next vertex
				path.addLine(to: point)
			}
		}
		
		path.closeSubpath()
		
		return path
	}
}
