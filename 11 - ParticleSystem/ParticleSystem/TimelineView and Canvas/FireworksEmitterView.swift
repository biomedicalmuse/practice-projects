//
//  FireworksEmitterView.swift
//  ParticleSystem
//
//  Created by Natasha Godwin on 9/29/22.
//

import SwiftUI

/// A particle system that uses TimelineView and Canvas. 
struct FireworksEmitterView: View {
	// We only need to read data here, not watch it for changes.
	// So, there's no need for a property wrapper.
	var particleSystem: ParticleSystem
    var body: some View {
		 TimelineView(.animation) { timeline in
			 Canvas { context, size in
				 // Get the current date.
				 particleSystem.update(date: timeline.date)
				 
				 // Resolve images
				 var particleImage = context.resolve(particleSystem.image)
				 
				 // Get a backup of the context's transform property
				 // so it can be restored as needed
				 let baseTransform = context.transform
				 
				 // Blend overlapping particles when that setting is enabled
				 if particleSystem.enableBlending {
					  context.blendMode = .plusLighter
				 }
				 
				 /*
				  1. Loop over all the particles.
				  2. Calculate their position
				  3. Translate the graphics context to that location.
				  4. Draw the particles at 0, 0.
				  5. Reset the transform of the context/
				  */
				 for particle in particleSystem.particles {
					  let xPos = particle.x * size.width
					  let yPos = particle.y * size.height
					  let rotationAmount = Angle(degrees: particle.rotation)

					  // Move
					  context.translateBy(x: xPos, y: yPos)
					  // Scale
					 context.scaleBy(x: particle.scale, y: particle.scale)
					 // Change appearance
					 context.opacity = particle.opacity
					 // Rotate
					 context.rotate(by: rotationAmount)
					 // Color
					 particleImage.shading = .color(particle.color)
					 // Render
					 context.draw(particleImage, at: .zero)
					  context.transform = baseTransform
				 }
				 
			 }
		 }
    }
}

struct FireworksEmitterView_Previews: PreviewProvider {
    static var previews: some View {
        FireworksEmitterView(particleSystem: ParticleSystem())
    }
}
