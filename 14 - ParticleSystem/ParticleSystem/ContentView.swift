//
//  ContentView.swift
//  ParticleSystem
//
//  Created by Natasha Godwin on 9/24/22.
//

import SwiftUI

struct ContentView: View {
	@StateObject var particleSystem = ParticleSystem()
	var body: some View {
		HStack {
			FireworksEmitterView(particleSystem: particleSystem)
				.ignoresSafeArea()
				.background(.blue)
			ControlsView(particleSystem: particleSystem)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
