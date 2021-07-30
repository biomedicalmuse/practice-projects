//
//  ComposeView.swift
//  Timeline
//
//  Created by Natasha Godwin on 7/27/21.
//

import SwiftUI

struct ComposeView: View {
	@EnvironmentObject var notes: Notes
	@Environment(\.presentationMode) var presentationMode
	@State private var date = Date()
	@State private var text = ""
	@State private var changingDate = false
	
	var body: some View {
		VStack {
			VStack(alignment: .leading) {
				Group {
					HStack {
						Text(date.fullDate)
							.font(.largeTitle)
							.fontWeight(.bold)
						Spacer()
						Button(action: {
							notes.list.append(Note(date: date, text: text))
							self.presentationMode.wrappedValue.dismiss()
						}) {
							Image(systemName: "chevron.down")
								.font(.largeTitle)
						}
						.disabled(text.isEmpty)
					}.padding(.top)
					HStack {
						Text(date.time)
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
						DatePicker("Date", selection: $date, in: ...Date())
							.labelsHidden()
					}
				}
				.padding(.leading)
				.padding(.trailing)
				TextEditor(text: $text)
					.padding()
					.background(Color.gray.opacity(0.15))
					.lineSpacing(10.0)
			}
		}
	}
}
//struct ComposeView_Previews: PreviewProvider {
//    static var previews: some View {
//		ComposeView()
//    }
//}
