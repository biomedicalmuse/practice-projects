//
//  Double-Extension.swift
//  SwiftMath
//
//  Created by Natasha Godwin on 4/2/22.
//

import Foundation

// Used to convert between radians and degrees, the two ways to measure angles
// In SwiftUI, you have to use radians in trionometric functions.

extension Double {
	var inDegrees: Double { return self * 180 / .pi }
	var inRadians: Double { return self * .pi / 180 }
}


