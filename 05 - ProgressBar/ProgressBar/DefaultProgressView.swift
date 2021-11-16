//
//  DefaultProgressView.swift
//  ProgressBar
//
//  Created by Natasha Godwin on 11/16/21.
//

import SwiftUI

struct DefaultProgressView: View {
	@State private var progress = 0.0
	 var body: some View {
		 VStack {
			 ProgressView(value: progress)
				 .animation(.easeIn)
				 .padding()
			 Button("Update", action: { progress += 0.05 })
		 }
	 }
}

struct DefaultProgressView_Previews: PreviewProvider {
    static var previews: some View {
        DefaultProgressView()
    }
}
