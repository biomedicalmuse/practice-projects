//
//  ContentView.swift
//  ParticleSystem
//
//  Created by Natasha Godwin on 9/24/22.
//

import SwiftUI

struct ContentView: View {
	@State private var particleMode = 0
	let modes = ["Confetti", "Explosion", "Fireflies", "Magic", "Rain", "Smoke", "Snow"]
    var body: some View {
		 VStack {
			 ZStack {
				  if particleMode == 0 {
						// Confetti
						EmitterView(
							images: ["confetti"],
							particleCount: 50,
							creationPoint: .init(x: 0.5, y: -0.1),
							creationRange: CGSize(width: 1, height: 0),
							colors: [.red, .yellow, .blue, .green, .white, .orange, .purple],
							angle: .degrees(180),
							angleRange: .radians(.pi / 4),
							rotationRange: .radians(.pi * 2),
							rotationSpeed: .radians(.pi),
							scale: 0.6,
							speed: 1200,
							speedRange: 800,
							animation: Animation.linear(duration: 5).repeatForever(autoreverses: false), animationDelayThreshold: 5).id(1)
				  } else if particleMode == 1 {
						// explosion
						EmitterView(
							images: ["spark"],
							particleCount: 500,
							colors: [.red],
							blendMode: .screen,
							angleRange: .degrees(360),
							opacitySpeed: -1,
							scale: 0.4,
							scaleRange: 0.1,
							scaleSpeed: 0.3,
							speed: 60,
							speedRange: 80,
							animation: Animation.easeOut(duration:     1).repeatForever(autoreverses: false)).id(2)
				  } else if particleMode == 2 {
						// fireflies
						EmitterView(
							images: ["spark"],
							particleCount: 100,
							creationRange: CGSize(width: 1, height: 1),
							colors: [.yellow],
							blendMode: .screen,
							angleRange: .degrees(360),
							opacitySpeed: -1,
							scale: 0.5,
							scaleRange: 0.2,
							scaleSpeed: -0.2,
							speed: 120,
							speedRange: 120,
							animation: Animation.easeInOut(duration: 1).repeatForever(autoreverses: false), animationDelayThreshold: 1).id(3)
				  } else if particleMode == 3 {
						// magic
						EmitterView(
							images: ["spark"],
							particleCount: 200,
							colors: [Color(red: 0.5, green: 1, blue: 1)],
							blendMode: .screen,
							angleRange: .degrees(360),
							opacitySpeed: -1,
							scale: 0.5,
							scaleRange: 0.2,
							scaleSpeed: -0.2,
							speed: 120,
							speedRange: 120,
							animation: Animation.easeOut(duration: 1).repeatForever(autoreverses: false), animationDelayThreshold: 1).id(4)
				  } else if particleMode == 4 {
						// rain
						EmitterView(
							images: ["line"],
							particleCount: 100,
							creationPoint: .init(x: 0.5, y: -0.1),
							creationRange: CGSize(width: 1, height: 0),
							colors: [Color(red: 0.8, green: 0.8, blue: 1)],
							angle: .degrees(180),
							opacityRange: 1,
							scale: 0.6,
							speed: 1000,
							speedRange: 400,
							animation: Animation.linear(duration: 1).repeatForever(autoreverses: false), animationDelayThreshold: 1).id(5)
				  } else if particleMode == 5 {
						// smoke
						EmitterView(
							images: ["spark"],
							particleCount: 200,
							colors: [.gray],
							blendMode: .screen,
							angleRange: .degrees(90),
							opacitySpeed: -1,
							scale: 0.3,
							scaleRange: 0.1,
							scaleSpeed: 1,
							speed: 100,
							speedRange: 80,
							animation: Animation.linear(duration: 3).repeatForever(autoreverses: false), animationDelayThreshold: 3).id(6)
				  } else if particleMode == 6 {
						// snow
						EmitterView(
							images: ["spark"],
							particleCount: 100,
							creationPoint: .init(x: 0.5, y: -0.1),
							creationRange: CGSize(width: 1, height: 0),
							colors: [.white],
							angle: .degrees(180),
							angleRange: .degrees(10),
							opacityRange: 1,
							scale: 0.4,
							scaleRange: 0.4,
							speed: 2000,
							speedRange: 1500,
							animation: Animation.linear(duration: 10).repeatForever(autoreverses: false), animationDelayThreshold: 10).id(7)
				  }
			 }
			 .background(Color.black)
			 .edgesIgnoringSafeArea(.all)
			 
			 Picker("Select a mode", selection: $particleMode) {
				  ForEach(0..<modes.count) { mode in
						Text(self.modes[mode])
				  }
			 }
			 .pickerStyle(.menu)
      }
	 }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
