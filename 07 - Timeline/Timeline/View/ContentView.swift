//
//  ContentView.swift
//  Timeline
//
//  Created by Natasha Godwin on 7/24/21.
//

import SwiftUI

struct ContentView: View {
	 @EnvironmentObject var notes: Notes 
	 @State private var writingNote = false
	 
	 init() {
		UITextView.appearance().backgroundColor = .clear
	 }
    var body: some View {
			NavigationView {
				ScrollView(.vertical) {
					ForEach(notes.list.indexed()) { note in
						NoteView(note: $notes.list[note.index])
					}
				}
				.navigationBarTitle("Timeline")
				.navigationBarItems(trailing: ComposeButton(action: $writingNote))
				.frame(maxWidth: .infinity)
		  }
			.sheet(isPresented: $writingNote) {
				ComposeView()
					.environmentObject(notes)
			}
	 }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
			.environmentObject(Notes())
    }
}
