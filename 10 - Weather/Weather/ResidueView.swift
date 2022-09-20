//
//  ResidueView.swift
//  Weather
//
//  Created by Natasha Godwin on 9/19/22.
//

import SwiftUI

/// A view that displays residue particles, i.e. rain or snow.
///
/// This is nearly identical to StormView. It only differs in five ways:
/// 1. It uses a Residue model, not a Storm one.
/// 2. The canvas context isn't rotated here because it's not required.
/// 3. It doesn't have an ignoresSafeArea() modifier.
/// 4. It doesn't need a direction in the preview because that's already handled in the ResidueDrop class.
/// 5. This won't show anything until it's placed inside another view that shows weather data because the residue needs to move up or down as the user scrolls around the interface. See: WeatherDetailsView. 
struct ResidueView: View {
	 let residue: Residue

	 var body: some View {
		  TimelineView(.animation) { timeline in
				Canvas { context, size in
					 residue.update(date: timeline.date, size: size)

					 for drop in residue.drops {
						  var contextCopy = context

						  let xPos = drop.x * size.width
						  let yPos = drop.y * size.height

						  contextCopy.opacity = drop.opacity
						  contextCopy.translateBy(x: xPos, y: yPos)
						  contextCopy.scaleBy(x: drop.scale, y: drop.scale)
						  contextCopy.draw(residue.image, at: .zero)
					 }
				}
		  }
	 }

	 init(type: Storm.Contents, strength: Double) {
		  residue = Residue(type: type, strength: strength)
	 }
}

struct ResidueView_Previews: PreviewProvider {
	 static var previews: some View {
		  ResidueView(type: .rain, strength: 200)
	 }
}
