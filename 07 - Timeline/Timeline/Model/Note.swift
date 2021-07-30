//
//  Note.swift
//  Timeline
//
//  Created by Natasha Godwin on 7/23/21.
//

import Foundation

struct Note: Identifiable, Equatable {
	let id = UUID()
	var date: Date
	var text: String
}

class Notes: ObservableObject {
	@Published var list = [Note]()
	
	func add(note: Note) {
		if !list.contains(note) && note.text != "" {
			list.append(note)
		}
	}
	
	func delete(at location: IndexSet) {
		list.remove(atOffsets: location)
	}
}
