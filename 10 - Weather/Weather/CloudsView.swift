//
//  CloudsView.swift
//  Weather
//
//  Created by Natasha Godwin on 9/12/22.
//

import SwiftUI

struct CloudsView: View {
	var cloudGroup: CloudGroup

		 var body: some View {
			  TimelineView(.animation) { timeline in
					Canvas { context, size in
						 context.opacity = cloudGroup.opacity
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

							 let cloudImage = "cloud\(cloud.imageNumber)"
							 context.draw(Image(cloudImage), at: .zero, anchor: .topLeading)

							 context.transform = .identity
						}
					}
			  }
			  .ignoresSafeArea()
			  .frame(maxWidth: .infinity, maxHeight: .infinity)
		 }

		 init(thickness: Cloud.Thickness) {
			  cloudGroup = CloudGroup(thickness: thickness)
		 }
}

struct CloudsView_Previews: PreviewProvider {
    static var previews: some View {
		 CloudsView(thickness: .regular)
    }
}
