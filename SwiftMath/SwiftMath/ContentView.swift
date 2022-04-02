//
//  ContentView.swift
//  SwiftMath
//
//  Created by Natasha Godwin on 4/2/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		 VStack {
			 ZStack {
				 Text("Topic")
				 Polygon(sides: 6)
					 .fill(Color.secondary.opacity(0.2))
			 }.padding(.horizontal)
		 }
		 .frame(width: 300, height: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
