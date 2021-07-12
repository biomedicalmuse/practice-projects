//
//  AddEventView.swift
//  TimeTravel
//
//  Created by Natasha Godwin on 7/12/21.
//

import SwiftUI

struct AddEventView: View {
	@State private var event = ""
	@State private var date = Date()
	@Environment(\.presentationMode) var presentationMode
	 var body: some View {
		NavigationView {
			Form {
				TextField("Event", text: $event)
				DatePicker("Date", selection: $date)
					.labelsHidden()
					.datePickerStyle(GraphicalDatePickerStyle())
			}
			.navigationBarTitle("New Event")
			.navigationBarItems(trailing: Button("Save") {
				// Code
				presentationMode.wrappedValue.dismiss()
			})
		}
	 }
}

struct AddEventView_Previews: PreviewProvider {
    static var previews: some View {
        AddEventView()
    }
}
