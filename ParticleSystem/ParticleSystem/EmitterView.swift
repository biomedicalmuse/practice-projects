//
//  EmitterView.swift
//  ParticleSystem
//
//  Created by Natasha Godwin on 9/24/22.
//

import SwiftUI

struct EmitterView: View {
	private struct ParticleView: View {
		@State var isActive: Bool = false
		let position: ParticleState<CGPoint>
		let image: Image
		let opacity: ParticleState<Double>
		let rotation: ParticleState<Angle>
		let scale: ParticleState<CGFloat>
		
		var body: some View {
			image
				.opacity(isActive ? opacity.end : opacity.start)
				.scaleEffect(isActive ? scale.end : scale.start)
				.rotationEffect(isActive ? rotation.end : rotation.start)
				.position(isActive ? position.end : position.start)
				.onAppear { self.isActive = true }
		}
	}
	
	var images: [String]
	
	var particleCount: Int
	
	var creationPoint = UnitPoint.center
	var creationRange = CGSize.zero
	
	var colors = [Color.white]
	var blendMode = BlendMode.normal
	
	var angle = Angle.zero
	var angleRange = Angle.zero
	
	var opacity = 1.0
	var opacityRange = 0.0
	var opacitySpeed = 0.0 // how fast it changes
	
	var rotation = Angle.zero
	var rotationRange = Angle.zero
	var rotationSpeed = Angle.zero

	var scale: CGFloat = 1
	var scaleRange: CGFloat = 0
	var scaleSpeed: CGFloat = 0
	
	var speed = 50.0
	var speedRange = 0.0
	
	var animation = Animation.linear(duration: 1).repeatForever(autoreverses: false)
	var animationDelayThreshold = 0.0
	
	private struct ParticleState<T> {
		var start: T
		var end: T
		
		init(_ start: T, _ end: T) {
			self.start = start
			self.end = end
		}
	}

	
    var body: some View {
		 GeometryReader { geometry in
			 ZStack {
				 ForEach(0..<particleCount, id: \.self) { _ in
					 ParticleView(
						position: position(in: geometry),
						image: Image(images.randomElement()!),
						opacity: makeOpacity(),
						rotation: makeRotation(),
						scale: makeScale()
					 )
					   .animation(animation.delay(Double.random(in: 0...animationDelayThreshold)))
						 .colorMultiply(colors.randomElement() ?? .white) // give each particle a random color
						 .blendMode(blendMode) // apply the blend mode
				 }
			 }
		 }
    }
	
	private func position(in proxy: GeometryProxy) -> ParticleState<CGPoint> {
		 // Set boundaries on where the particles can move
		let halfCreationRangeWidth = creationRange.width / 2
		let halfCreationRangeHeight = creationRange.height / 2
		
		// Create a range of X and Y positions, from the negative to positive values above
		let creationOffsetX = CGFloat.random(in: -halfCreationRangeWidth...halfCreationRangeWidth)
		let creationOffsetY = CGFloat.random(in: -halfCreationRangeHeight...halfCreationRangeHeight)
		
		/*
		 Calculate the starting point:
		 
		 (creationPoint + creationOffsetX) * width
		 
		 */
		let startX = Double(proxy.size.width * (creationPoint.x + creationOffsetX))
		let startY = Double(proxy.size.height * (creationPoint.y + creationOffsetY))
		let start = CGPoint(x: startX, y: startY)
		
		// Calculate speed
		let halfSpeedRange = speedRange / 2
		let actualSpeed  = speed + Double.random(in: -halfSpeedRange...halfSpeedRange)
		
		// Calculate direction
		let halfAngleRange = angleRange.radians / 2
		let actualDirection = angle.radians + Double.random(in: -halfAngleRange...halfAngleRange)
		
		/*
		 Calculate the end point by ...
		 
		 1. Getting the cosine of the direction * speed (X coordinate)
		 2. Getting the sine of the direction * speed (Y coordinate)
		 3. Adding the results to their initial values.
		 4. Returning the result
		 */
		let finalX = cos(actualDirection - .pi / 2) * actualSpeed
		let finalY = sin(actualDirection - .pi / 2) * actualSpeed
		let end = CGPoint(x: startX + finalX, y: startY + finalY)

		return ParticleState(start, end)
		
	}
	
	private func makeOpacity() -> ParticleState<Double> {
		 let halfOpacityRange = opacityRange / 2
		 let randomOpacity = Double.random(in: -halfOpacityRange...halfOpacityRange)
		 return ParticleState(opacity + randomOpacity, opacity + opacitySpeed + randomOpacity)
	}

	private func makeScale() -> ParticleState<CGFloat> {
		 let halfScaleRange = scaleRange / 2
		 let randomScale = CGFloat.random(in: -halfScaleRange...halfScaleRange)
		 return ParticleState(scale + randomScale, scale + scaleSpeed + randomScale)
	}
	
	private func makeRotation() -> ParticleState<Angle> {
		 let halfRotationRange = (rotationRange / 2).radians
		 let randomRotation = Double.random(in: -halfRotationRange...halfRotationRange)
		 let randomRotationAngle = Angle(radians: randomRotation)
		 return ParticleState(rotation + randomRotationAngle, rotation + rotationSpeed + randomRotationAngle)
	}
	
	
}

struct EmitterView_Previews: PreviewProvider {
    static var previews: some View {
		 EmitterView( images: ["spark", "confetti", "line"], particleCount: 1)
			 .background(.blue)
    }
}
