//
//  ContentView.swift
//  DragAndDrop
//
//  Created by Natasha Godwin on 2/11/22.
//

import SwiftUI


struct ContentView: View {
	// Tracks how far the view has been dragged
	@State private var offset = CGSize.zero
	
    var body: some View {
		 Text("Hello, World")
			 .padding()
			 .background(Color.blue)
			 .foregroundColor(Color.white)
			 .offset(offset)
			 .gesture(
				DragGesture()
					.onChanged { gesture in
						offset = gesture.translation
					}
					.onEnded { _ in
						if abs(offset.height) > 200 {
							offset = offset
						} else {
							withAnimation(.easeOut) {
								offset = .zero
							}
						}
				 }
		  )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
