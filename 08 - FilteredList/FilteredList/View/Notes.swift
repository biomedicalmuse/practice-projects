//
//  Notes.swift
//  FilteredList
//
//  Created by Natasha Godwin on 8/12/21.
//

import SwiftUI
import CoreData

struct Notes: View {
	@Environment(\.managedObjectContext) var viewContext
	@State var dateFilter: Date
	var body: some View {
		NavigationView {
			VStack {
				Text("Show Dates After:")
					.font(.caption)
					.textCase(.uppercase)
				DatePicker("", selection: $dateFilter, displayedComponents: .date)
					.labelsHidden()
				FilteredList(filter: dateFilter)
			}
			.navigationBarTitle("Timeline")
			.navigationBarItems(trailing: Button("Add") {
				let note1 = Note(context: self.viewContext)
				note1.date = Date()
				note1.content = "Started Chaos and Fractals course."
				
				let note2 = Note(context: self.viewContext)
				note2.date = Date().addingTimeInterval(-86400)
				note2.content = "Ran my first 5K!"
				
				let note3 = Note(context: self.viewContext)
				note3.date = Date().addingTimeInterval(-172800)
				note3.content = "Finished 100 Days of SwiftUI"
				
				let note4 = Note(context: self.viewContext)
				note4.date = Date().addingTimeInterval(-360500)
				note4.content = "Booked vacation to Tokyo"
				
				let note5 = Note(context: self.viewContext)
				note5.date = Date().addingTimeInterval(-380400)
				note5.content = "Celebrated my birthday at home"
				
				try? viewContext.save()
			})
		 }
	}
}

struct Notes_Previews: PreviewProvider {
    static var previews: some View {
		 Notes(dateFilter: Date())
    }
}
