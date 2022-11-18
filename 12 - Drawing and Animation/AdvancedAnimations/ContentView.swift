//
//  ContentView.swift
//  AdvancedAnimations
//
//  Created by Natasha Godwin on 9/30/22.
//

import SwiftUI


struct ContentView: View {
	@State private var date = Date()
	var body: some View {
		TimelineView(.periodic(from: date, by: 1)) { context in
			Circle()
				.fill(Color.blue)
				.padding()
				.offset(x: -0.0, y: -150.0)
				.frame(width: 100.0, height: 100.0)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
