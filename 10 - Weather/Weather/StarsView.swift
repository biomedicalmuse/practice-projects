//
//  StarsView.swift
//  Weather
//
//  Created by Natasha Godwin on 9/15/22.
//

import SwiftUI

struct StarsView: View {
	@State var starField = StarField()
	/// An @State property for tracking whether a meteor shower is happening
	///
	/// @State is used here because it keeps the class instance alive without actively watching it for changes.
	@State var meteorShower = MeteorShower()
	
    var body: some View {
		 TimelineView(.animation) { timeline in
			 Canvas { context, size in
				 let timeInterval = timeline.date.timeIntervalSince1970
				 
				 // Moves stars to the left over time
				 starField.update(date: timeline.date)
				 
				 // Update meteors
				 meteorShower.update(date: timeline.date, size: size)
				 
				 // Colors for the meteor gradient
				 let rightColors = [.clear, Color(red: 0.8, green: 1, blue: 1), .white]
				 let leftColors = Array(rightColors.reversed())
				 
				 // Adjust the X position of the meteor while using the meteor's length for its width.
				 for meteor in meteorShower.meteors {
					  var contextCopy = context

					  if meteor.isMovingRight {
							contextCopy.rotate(by: .degrees(10))
							let path = Path(CGRect(x: meteor.x - meteor.length, y: meteor.y, width: meteor.length, height: 2))
						  contextCopy.fill(path, with: .linearGradient(.init(colors: rightColors), startPoint: CGPoint(x: meteor.x - meteor.length, y: 0), endPoint: CGPoint(x: meteor.x, y: 0)))
					  } else {
							contextCopy.rotate(by: .degrees(-10))
							let path = Path(CGRect(x: meteor.x, y: meteor.y, width: meteor.length, height: 2))
						  contextCopy.fill(path, with: .linearGradient(.init(colors: leftColors), startPoint: CGPoint(x: meteor.x, y: 0), endPoint: CGPoint(x: meteor.x + meteor.length, y: 0)))
					  }

					  // add a glow
				 }
				 
				 // Blurs the stars
				 context.addFilter(.blur(radius: 0.3))
				 for (index, star) in starField.stars.enumerated() {
					 let path = Path(ellipseIn: CGRect(x: star.x, y: star.y, width: star.size, height: star.size))
					 
					 if star.flickerInterval == 0 {
						  // Flashing star
						 /*
						  Each star will generate a different sine value and therefore flash at different intervals
						  Abs is called on this value to make sure the result is positive (visible on the screen).
						  This result is then halved and then added to 0.5, so it lies in the range of 0.5 to 1, making it both fully visible at all times and partly transparent.
						  */
						 var flashLevel = sin(Double(index) + timeInterval * 4)
						 flashLevel = abs(flashLevel)
						 flashLevel /= 2
						 context.opacity = 0.5 + flashLevel
					 } else {
						  // Blooming star
						 /*
						  This effect is created by drawing several blurred circles before the star itself.
						  The opacity is mostly negative here, so the stars appear at different times.
						  The flicker interval will be a number from -5 to 1 (low-end) and -39 to 1 (high-end).
						  This means that most of the "blooms" will be invisible, but sometimes they'll be above 0 - visible in short bursts, like a flower blooming.
						  */
						 var flashLevel = sin(Double(index) + timeInterval)
						 flashLevel *= star.flickerInterval
						 flashLevel -= star.flickerInterval - 1
						 
						 if flashLevel > 0 {
							  var contextCopy = context
							  contextCopy.opacity = flashLevel
							  contextCopy.addFilter(.blur(radius: 3))
							  contextCopy.fill(path, with: .color(white: 1))
							  contextCopy.fill(path, with: .color(white: 1))
							  contextCopy.fill(path, with: .color(white: 1))
						 }
						 
						 // Draw the star normally, regardless of whether the bloom effect was applied or not.
						 context.opacity = 1
					 }
					 
					 // Some stars will appear orange; others, white.
					 if index.isMultiple(of: 5) {
						 context.fill(path, with: .color(red: 1, green: 0.85, blue: 0.8))
					 } else {
						 context.fill(path, with: .color(white: 1))
					 }
				 }
			 }
			 .ignoresSafeArea()
			 // Stars closer to the horizon line will fade out
			 .mask(
				LinearGradient(colors: [.white, .clear], startPoint: .top, endPoint: .bottom)
		     )
		 }
    }
}

struct StarsView_Previews: PreviewProvider {
    static var previews: some View {
        StarsView()
			 .background(.black)
    }
}
