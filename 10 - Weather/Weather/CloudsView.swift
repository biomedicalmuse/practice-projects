//
//  CloudsView.swift
//  Weather
//
//  Created by Natasha Godwin on 9/12/22.
//

import SwiftUI

struct CloudsView: View {
	var cloudGroup: CloudGroup
	let topTint: Color
	let bottomTint: Color
	
	init(thickness: Cloud.Thickness, topTint: Color, bottomTint: Color) {
		 cloudGroup = CloudGroup(thickness: thickness)
		 self.topTint = topTint
		 self.bottomTint = bottomTint
	}

		 var body: some View {
			  TimelineView(.animation) { timeline in
					Canvas { context, size in
						 context.opacity = cloudGroup.opacity
						 // Convert each cloud image to a resolved image
						let resolvedImages = (0..<8).map { i -> GraphicsContext.ResolvedImage in
							 let sourceImage = Image("cloud\(i)")
							 var resolved = context.resolve(sourceImage)
							// Read the size of the resolved image for the gradient
							 resolved.shading = .linearGradient(
								 Gradient(colors: [topTint, bottomTint]),
								 startPoint: CGPoint(x: 0, y: 0),
								 endPoint: CGPoint(x: 0, y: resolved.size.height)
							 )
							 return resolved
						}
						 cloudGroup.update(date: timeline.date)
						 /*
						  The Canvas view works with a rendering transform that sets the location, scale, and rotation of whatever is being drawn. In the Cloud model, we give each cloud a unique scale before it is drawn here, which will make it appear much closer or further than expected.
						  
						  To fix that, this code does the following:
						  1. Translates the canvas context to the correct location
						  2. Scales the image according to the cloud's settings.
						  */
						for cloud in cloudGroup.clouds {
							 context.translateBy(x: cloud.position.x, y: cloud.position.y)
							 context.scaleBy(x: cloud.scale, y: cloud.scale)

							context.draw(resolvedImages[cloud.imageNumber], at: .zero, anchor: .topLeading)

							 context.transform = .identity
						}
					}
			  }
			  .ignoresSafeArea()
			  .frame(maxWidth: .infinity, maxHeight: .infinity)
		 }
}

struct CloudsView_Previews: PreviewProvider {
    static var previews: some View {
		 CloudsView(thickness: .regular, topTint: .white, bottomTint: .white)
				.background(.blue)
    }
}
