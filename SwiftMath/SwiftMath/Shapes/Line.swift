//
//  Line.swift
//  SwiftMath
//
//  Created by Natasha Godwin on 4/2/22.
//

import SwiftUI

// Draws a line, given a CGPoint, an angle, and a distance.

struct Line: Shape {
	let firstPoint: CGPoint
	let direction: Angle
	let distance: CGFloat
	
	func path(in rectangle: CGRect) -> Path {
		let x = firstPoint.x + distance * CGFloat(cos(direction.radians))
		let y = firstPoint.y - distance * CGFloat(sin(direction.radians))
		
		let secondPoint = CGPoint(x: x, y: y)
		
		var path = Path()
		
		path.move(to: firstPoint)
		path.addLine(to: secondPoint)
		
		return path
	}
}
