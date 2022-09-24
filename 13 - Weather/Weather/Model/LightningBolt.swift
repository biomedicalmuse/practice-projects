//
//  LightningBolt.swift
//  Weather
//
//  Created by Natasha Godwin on 9/20/22.
//

import SwiftUI

/// A class that contains a single lightning bolt.
///
/// This has three properties: coordinates, width, and angle. 
class LightningBolt {
	var points = [CGPoint]()
	var width: Double
	var angle: Double
	
	init(start: CGPoint, width: Double, angle: Double) {
		points.append(start)
		self.width = width
		self.angle = angle
	}
}
