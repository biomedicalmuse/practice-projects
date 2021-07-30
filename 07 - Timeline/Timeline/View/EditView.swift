//
//  EditView.swift
//  Timeline
//
//  Created by Natasha Godwin on 7/27/21.
//

import SwiftUI

struct EditView: View {
	@EnvironmentObject var notes: Notes
	@Environment(\.presentationMode) var presentationMode
	@Binding var note: Note
	@State private var changingDate = false
	
	var body: some View {
		VStack {
			VStack(alignment: .leading) {
				Group {
					HStack {
						Text(note.date.fullDate)
							.font(.largeTitle)
							.fontWeight(.bold)
						Spacer()
						Button(action: {
							presentationMode.wrappedValue.dismiss()
						}) {
							Text("Done")
						}
					}.padding(.top)
					HStack {
						Text(note.date.time)
							.font(.caption)
							.foregroundColor(.secondary)
						Button(action: {
							changingDate.toggle()
						}) {
							Image(systemName: "chevron.down.square.fill")
								.font(.headline)
								.foregroundColor(.secondary)
						}
					}
					if changingDate == true {
						DatePicker("Date", selection: $note.date, in: ...Date())
							.labelsHidden()
					}
				}
				.padding(.leading)
				.padding(.trailing)
				TextEditor(text: $note.text)
					.padding()
					.background(Color.gray.opacity(0.15))
					.lineSpacing(10.0)
			}
		}
	}
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
		EditView(note: .constant(Note(date: Date(), text: "This is a note.")))
    }
}
