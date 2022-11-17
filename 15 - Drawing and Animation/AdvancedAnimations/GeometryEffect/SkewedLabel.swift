//
//  SkewedLabel.swift
//  AdvancedAnimations
//
//  Created by Natasha Godwin on 11/16/22.
//

import SwiftUI

struct LabelView: View {
	 let text: String = "Time Warped"
	 var offset: CGFloat
	 var progress: CGFloat
	 let backgroundColor: Color

	 var body: some View {

		  Text("Time Warped")
				.font(.headline)
				.padding(5)
				.background(RoundedRectangle(cornerRadius: 5).foregroundColor(backgroundColor))
				.foregroundColor(Color.black)
				.modifier(SkewedOffset(offset: offset, progress: progress, goingRight: offset > 0))

	 }
}

struct SkewedLabel: View {
	@State private var moveIt = false
	let animation: Animation = .easeInOut(duration: 1.0)

	var body: some View {
		VStack {
			LabelView(offset: moveIt ? 120 : -120, progress: moveIt ? 1 : 0, backgroundColor: .red)
				.animation(animation, value: moveIt)

			 LabelView(offset: moveIt ? 120 : -120, progress: moveIt ? 1 : 0, backgroundColor: .orange)
				.animation(animation.delay(0.1), value: moveIt)

			 LabelView(offset: moveIt ? 120 : -120, progress: moveIt ? 1 : 0, backgroundColor: .yellow)
				.animation(animation.delay(0.2), value: moveIt)

			 LabelView(offset: moveIt ? 120 : -120, progress: moveIt ? 1 : 0, backgroundColor: .green)
				.animation(animation.delay(0.3), value: moveIt)

			 LabelView(offset: moveIt ? 120 : -120, progress: moveIt ? 1 : 0, backgroundColor: .blue)
				.animation(animation.delay(0.4), value: moveIt)

			 LabelView(offset: moveIt ? 120 : -120, progress: moveIt ? 1 : 0, backgroundColor: .purple)
				.animation(animation.delay(0.5), value: moveIt)

			 LabelView(offset: moveIt ? 120 : -120, progress: moveIt ? 1 : 0, backgroundColor: .pink)
				.animation(animation.delay(0.6), value: moveIt)

			 Button(action: { moveIt.toggle() }) { Text("Animate") }.padding(.top, 50)
		}
		.onTapGesture { self.moveIt.toggle() }
	}
}

struct SkewedLabel_Previews: PreviewProvider {
    static var previews: some View {
        SkewedLabel()
    }
}
