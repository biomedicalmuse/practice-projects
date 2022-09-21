//
//  SunView.swift
//  Weather
//
//  Created by Natasha Godwin on 9/21/22.
//

import SwiftUI

struct SunView: View {
	let progress: Double
	
	var sunX: Double {
		/*
		 Without this computed property, the sun will rise and set at odd times.
		 To fix it, we're delaying its rise by pushing its values backward and then multiplying the result, so it moves faster.
		 This will be used in place of progress in the position modifer attached to GeometryReader.
		 */
		 (progress - 0.1) * 1.2
	}
	
	/*
	 The sun will slowly rock from side to side,
	 and the halo and lens flares also gently move,
	 like Ariana Grande meets Beyoncé.
	 
	 🎶
	 I've been here all night
	 I've been here all day,
	 And boy, got me walkin' side to side
	 🎶
	 Standin' in the light of your halo
	 I got my angel now
	 🎶
	 
	 */
	@State private var haloScale = 1.0
	@State private var sunRotation = 0.0
	@State private var flareDistance = 80.0
	
    var body: some View {
		 GeometryReader { proxy in
			 ZStack {
				 Image("halo")
					 .blur(radius: 3)
					 .scaleEffect(haloScale)
				    // The halo will only appear during the day.
					 .opacity(sin(progress * .pi) * 3 - 2)
				 Image("sun")
					 .blur(radius: 2)
					 .rotationEffect(.degrees(sunRotation))
				 
				 // Flare effect
				 VStack {
					  Spacer()
							.frame(height: 200)

					  ForEach(0..<3) { i in
							Circle()
								 .fill(.white.opacity(0.2))
								 .frame(width: 16 + Double(i * 10), height: 16 + Double(i * 10))
						       /*
								  The circles will be placed unevenly, so they look more natural.
								  */
								 .padding(.top, 40 + (sin(Double(i) / 2) * flareDistance))
								 .blur(radius: 1)
						       // The lens flares circles will only appear during the day. 
								 .opacity(sin(progress * .pi) - 0.7)
					  }
				 }
			 }
			 .blendMode(.screen)
			  // Each animation runs on its own timeline.
			 .onAppear {
				  withAnimation(.easeInOut(duration: 7).repeatForever(autoreverses: true)) {
						haloScale = 1.3
				  }

				  withAnimation(.easeInOut(duration: 8).repeatForever(autoreverses: true)) {
						sunRotation = 20
				  }

				  withAnimation(.easeInOut(duration: 30).repeatForever(autoreverses: true)) {
						flareDistance = -70
				  }
			 }
			 .position(x: proxy.frame(in: .global).width * sunX, y: 50)
			 // Rotate the sun from -90 to 90 degrees as it moves.
			 .rotationEffect(.degrees((progress - 0.5) * 180))
		 }
		 .ignoresSafeArea()
    }
}

struct SunView_Previews: PreviewProvider {
    static var previews: some View {
		 SunView(progress: 0.5)
			 .background(.blue)
    }
}
