//
//  LightningView.swift
//  Weather
//
//  Created by Natasha Godwin on 9/20/22.
//

import SwiftUI

struct LightningView: View {
	 var lightning: Lightning
	
	 init(maximumBolts: Int = 4, forkProbability: Int = 20) {
		 lightning = Lightning(maximumBolts: maximumBolts, forkProbability: forkProbability)
	 }

	 var body: some View {
		  TimelineView(.animation) { timeline in
				Canvas { context, size in
					 lightning.update(date: timeline.date, in: size)
					
					// When the lightning bolt "hits bottom", the screen will flash
					let fullScreen = Path(CGRect(origin: .zero, size: size))
					context.fill(fullScreen, with: .color(.white.opacity(lightning.flashOpacity)))

					
					/*
					 To create a blur effect, each bolt is drawn twice,
					 with a blur effect between each.
					 */
					for _ in 0..<2 {
						for bolt in lightning.bolts {
							 var path = Path()
							 path.addLines(bolt.points)
							 context.stroke(path, with: .color(.white), lineWidth: bolt.width)
						}
					  
					  context.addFilter(.blur(radius: 3))
					}
				}
		  }
		  .ignoresSafeArea()
		  .onTapGesture {
				lightning.strike()
		  }
	 }
}

struct LightningView_Previews: PreviewProvider {
    static var previews: some View {
        LightningView()
			 .background(.black)
    }
}
