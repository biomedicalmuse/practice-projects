//
//  TickingClock.swift
//  AdvancedAnimations
//
//  Created by Natasha Godwin on 11/15/22.
//

import SwiftUI

/// A clock that updates the time when tapped 
struct TickingClock: View {
	@State private var time: ClockTime = ClockTime(hours: 6, minutes: 30, seconds: 0)
	@State private var duration: Double = 2.0
    var body: some View {
		 Clock(clockTime: time)
			.stroke(Color.blue, lineWidth: 3)
			.onTapGesture {
				withAnimation {
					time.seconds += 1
				}
			}
    }
}

struct TickingClock_Previews: PreviewProvider {
    static var previews: some View {
        TickingClock()
    }
}
