//
//  DetailView.swift
//  Timeline
//
//  Created by Natasha Godwin on 7/27/21.
//

import SwiftUI

struct NoteView: View {
	@EnvironmentObject var notes: Notes 
	@State private var editingNote = false
	@Binding var note: Note
	var body: some View {
		HStack(alignment: .top) {
			VStack {
				Rectangle()
					.frame(width: 20, height: 20)
					.clipShape(Circle())
					.foregroundColor(.blue)
				Rectangle()
					.frame(width: 2)
					.foregroundColor(.blue)
			}
			VStack(alignment: .leading, spacing: 10) {
				NavigationLink(destination: Text("Detail View")) {
					Text(note.date.fullDate)
						.font(.headline)
						.fontWeight(.bold)
				}
				Text(note.date.time)
					.font(.caption)
					.foregroundColor(.secondary)
				Text(note.text)
					.onTapGesture {
						editingNote.toggle()
					}
			}
			Spacer()
		}
		.padding()
		.sheet(isPresented: $editingNote) {
			EditView(note: $note)
				.environmentObject(notes)
		}
	}
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
		NoteView(note: .constant(Note(date: Date(), text: "This is a note.")))
			.environmentObject(Notes())
    }
}
