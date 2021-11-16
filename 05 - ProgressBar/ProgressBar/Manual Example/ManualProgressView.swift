//
//  ManualProgressView.swift
//  ProgressBar
//
//  Created by Natasha Godwin on 11/16/21.
//

import SwiftUI

struct ManualProgressView: View {
	@State private var progress: Float = 0.0
	let finished: Float = 1.0
	
	var body: some View {
		 VStack {
			  ManualProgressBar(value: $progress)
				 .frame(height: 15)
			  
			  if progress < finished {
					Button(action: self.addProgress) {
						 Text("Update Progress")
					}
			  } else {
					Button(action: self.resetProgress) {
						 Text("Reset")
					}
			  }
		 }
		 .padding()
	
	}
	
	func addProgress() {
		 self.progress += 0.10
	}
	
	func resetProgress() {
		 self.progress = 0.0
	}
}

struct ManualProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ManualProgressView()
    }
}
