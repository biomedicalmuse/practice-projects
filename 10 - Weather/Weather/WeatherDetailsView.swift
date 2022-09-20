//
//  WeatherDetailsView.swift
//  Weather
//
//  Created by Natasha Godwin on 9/19/22.
//

import SwiftUI

/// A view that is required to display ResidueView.
struct WeatherDetailsView: View {
	 // The color we'll be using to tint our background
	 let tintColor: Color

	 // What type of residue to create, and its strength
	 let residueType: Storm.Contents
	 let residueStrength: Double

	 var body: some View {
		  ScrollView {
				VStack(spacing: 0) {
					 ResidueView(type: residueType, strength: residueStrength)
						  .frame(height: 62)
						  .offset(y: 30)
						  .zIndex(1)

					 RoundedRectangle(cornerRadius: 25)
						  .fill(tintColor.opacity(0.25))
						  .frame(height: 800)
						  .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 25))
						  .padding(.horizontal, 20)
				}
				.padding(.top, 200)
		  }
	 }
}

struct WeatherDetailsView_Previews: PreviewProvider {
	 static var previews: some View {
		  WeatherDetailsView(tintColor: .blue, residueType: .rain, residueStrength: 200)
			 .background(.black)
	 }
}
