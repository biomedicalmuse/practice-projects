//
//  ShrinkingSquares.swift
//  AdvancedAnimations
//
//  Created by Natasha Godwin on 11/17/22.
//

import SwiftUI

struct ShrinkingSquares: Shape {
	 @Binding var minute: Double
	 @Binding var incrementBy: Double
	 func path(in rect: CGRect) -> Path {
		  var path = Path()

		 for i in stride(from: 1, through: minute, by: incrementBy) {
			  let rect = CGRect(x: 0.0, y: 0.0, width: rect.width, height: rect.height)
				let insetRect = rect.insetBy(dx: i, dy: i)
				path.addRect(insetRect)
		  }
		  return path
	 }
}
