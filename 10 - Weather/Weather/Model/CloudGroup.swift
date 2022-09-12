//
//  CloudGroup.swift
//  Weather
//
//  Created by Natasha Godwin on 9/12/22.
//

import Foundation


/// A group of clouds whose number, opacity, and scale varies based on the weather.
class CloudGroup {
	 var clouds = [Cloud]()
	 let opacity: Double
	
	/*
	 For any given level of cloud thickness, we’re going to adjust three values:
	 
    1. How many clouds to create.
	 2. How translucent those clouds should be.
	 3. How big or small the clouds can be.
	 
	 The number of clouds, opacity, and scale increases as thickness increases.
	 
	 */
	init(thickness: Cloud.Thickness) {
		 let cloudsToCreate: Int
		 let cloudScale: ClosedRange<Double>

		 switch thickness {
		 case .none:
			  cloudsToCreate = 0
			  opacity = 1
			  cloudScale = 1...1
		 case .thin:
			  cloudsToCreate = 10
			  opacity = 0.6
			  cloudScale = 0.2...0.4
		 case .light:
			  cloudsToCreate = 10
			  opacity = 0.7
			  cloudScale = 0.4...0.6
		 case .regular:
			  cloudsToCreate = 15
			  opacity = 0.8
			  cloudScale = 0.7...0.9
		 case .thick:
			  cloudsToCreate = 25
			  opacity = 0.9
			  cloudScale = 1.0...1.3
		 case .ultra:
			  cloudsToCreate = 40
			  opacity = 1
			  cloudScale = 1.2...1.6
		 }

		for i in 0..<cloudsToCreate {
			 let scale = Double.random(in: cloudScale)
			 let imageNumber = i % 8 // Decreases the chance of getting a duplicate image
			 let cloud = Cloud(imageNumber: imageNumber, scale: scale)
			 clouds.append(cloud)
		}
	}
}
