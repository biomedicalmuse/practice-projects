//
//  SquareClock.swift
//  AdvancedAnimations
//
//  Created by Natasha Godwin on 11/17/22.
//

import SwiftUI

struct SquareClock: View {
	@State var minute = 0.0
	@State var timeLimit = 60.0 // minutes
	@State var incrementBy = 10.0 // minutes
	var body: some View {
		VStack {
			ZStack {
				if minute == timeLimit {
					Text("Done")
						.frame(width: 100, height: 100)
						.foregroundColor(.white)
						.background(Color.blue)
				}
				ShrinkingSquares(minute: $minute, incrementBy: $incrementBy)
				  .stroke()
				 .frame(width: 200, height: 200)
			}
			HStack {
				Button("Start") {
					if minute < timeLimit {
						minute += 10.0
					}
				}
				Button("Reset") {
					minute = 0.0
				}
			}
			.buttonStyle(.bordered)
		}
		
			 
	}
}

struct SquareClock_Previews: PreviewProvider {
    static var previews: some View {
        SquareClock()
    }
}
