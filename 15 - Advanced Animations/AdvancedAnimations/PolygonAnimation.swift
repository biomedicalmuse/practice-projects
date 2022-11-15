//
//  PolygonAnimation.swift
//  AdvancedAnimations
//
//  Created by Natasha Godwin on 11/15/22.
//

import SwiftUI

struct PolygonAnimation: View {
	@State private var sides = 1
	@State private var scale = 1.0
	var body: some View {
		VStack {
			Polygon(sides: sides, scale: scale)
				.stroke(Color.blue, lineWidth: 3)
			HStack(spacing: 20) {
				 Button("1") {
					 withAnimation(.easeOut(duration: 1.0)) {
						 sides = 2
						 scale = 1.0
					 }
				 }
				 
				 Button("3") {
					 withAnimation(.easeOut(duration: 1.0)) {
						 sides = 3
						 scale = 0.7
					 }
				 }
				 
				 Button("7") {
					 withAnimation(.easeOut(duration: 1.0)) {
						 sides = 7
						 scale = 0.4
					 }
				 }
				 
				 Button("30") {
					 withAnimation(.easeOut(duration: 1.0)) {
						 sides = 30
						 scale = 1.0
					 }
				 }
			}
			.buttonStyle(.bordered)
			.tint(.blue)
		}
	}
}

struct PolygonAnimation_Previews: PreviewProvider {
    static var previews: some View {
        PolygonAnimation()
    }
}
