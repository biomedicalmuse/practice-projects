//
//  FilteredList.swift
//  FilteredList
//
//  Created by Natasha Godwin on 8/12/21.
//

import SwiftUI
import CoreData

struct FilteredList: View {
	@Environment(\.managedObjectContext) var viewContext
	var fetchRequest: FetchRequest<Note>
	var notes: FetchedResults<Note> {
		fetchRequest.wrappedValue
	}
	init(filter: Date) {
		fetchRequest = FetchRequest<Note>(
			entity: Note.entity(),
			sortDescriptors: [NSSortDescriptor(keyPath: \Note.date, ascending: true)],
			predicate: NSPredicate(format: "date >= %@", filter as CVarArg)
		)
	}
	var body: some View {
		List {
			ForEach(notes, id: \.self) { note in
				VStack(alignment: .leading, spacing: 10) {
					Text(note.formattedDate)
						.font(.headline)
					Text(note.wrappedContent)
				}
			}.onDelete(perform: delete)
		}
	}
	
	func delete(at locations: IndexSet) {
		for location in locations {
			// Find the book in the Fetch Request
			let note = notes[location]
			
			// Delete it from the context
			viewContext.delete(note)
			
			// Save changes
			try? viewContext.save()
	}
  }
}

struct FilteredList_Previews: PreviewProvider {
    static var previews: some View {
		 FilteredList(filter: Date())
    }
}
