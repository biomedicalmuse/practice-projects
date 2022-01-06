//
//  ContentView.swift
//  LockScreen
//
//  Created by Natasha Godwin on 1/5/22.

import SwiftUI


struct LockScreenButton: View {
	let activeImage: String
	let inactiveImage: String
	@State private var pressed = false
	@State private var activated = false
	
	var body: some View {
		Image(systemName: activated ? activeImage : inactiveImage)
			.font(.title3)
			.frame(width: 50, height: 50)
			.background(activated ? Color.white : Color.black.opacity(pressed ? 0.8 : 0.4))
			.foregroundColor(activated ? .black : .white)
			.clipShape(Circle())
			.scaleEffect(pressed ? 1.5 : 1)
			.animation(.spring(response: 0.5, dampingFraction: 0.7), value: pressed)
			.onLongPressGesture(minimumDuration: 0.4) { bool in
				pressed = bool
			} perform: {
				let generator = UIImpactFeedbackGenerator()
				generator.impactOccurred()
				activated.toggle()
				print("Tapped!")
				pressed = false
			}
	}
}

struct ContentView: View {
	@State private var activated = false
    var body: some View {
		 ZStack {
			 GeometryReader { geometry in
				 Image("wallpaper")
					.resizable()
					.scaledToFill()
					.frame(maxWidth: geometry.size.width)
				 Color.black.opacity(0.15)
				 VStack(spacing: 0) {
					 Image(systemName: activated ? "lock.open.fill": "lock.fill")
							.font(.headline)
							.padding(.top, 60)
							.onTapGesture {
								activated.toggle()
							}

					 Text(Date(), style: .time)
							.font(.system(size: 92, weight: .thin))

					 Text(Date(), style: .date)
							.font(.title2)
							// Changes the position of the view
							// To change the size of the frame, use .padding(.top, -10) instead
							.offset(y: -10)

					  Spacer()
					 
					 HStack {
						 LockScreenButton(activeImage: "flashlight.on.fill",  inactiveImage: "flashlight.off.fill")
						 Spacer()
						 LockScreenButton(activeImage: "camera.fill", inactiveImage: "camera")
					 }.padding(20)
					  Capsule()
							.fill(Color.white)
							.frame(width: 150, height: 5)
							.padding(.bottom, 10)
				 }
				 .frame(width: geometry.size.width)
				 .foregroundColor(.white)
			 }
		 }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
