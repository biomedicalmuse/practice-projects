//
//  ManualProgressBar.swift
//  ProgressBar
//
//  Created by Natasha Godwin on 11/16/21.
//

import SwiftUI

struct ManualProgressBar: View {
	 @Binding var value: Float
	 var body: some View {
		  GeometryReader { geometry in
				ZStack(alignment: .leading) {
					 Rectangle()
						  .frame(width: geometry.size.width, height: geometry.size.height)
						  .opacity(0.5)
						  .foregroundColor(Color(UIColor.systemTeal))
					 Rectangle()
						  .frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
						  .animation(.linear)
						  .foregroundColor(Color.blue)
				}
				.cornerRadius(50.0)
		  }
	 }
}

struct ManualProgressBar_Previews: PreviewProvider {
    static var previews: some View {
		 ManualProgressBar(value: .constant(0.0))
    }
}
