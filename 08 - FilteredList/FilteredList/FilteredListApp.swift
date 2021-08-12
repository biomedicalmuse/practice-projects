//
//  FilteredListApp.swift
//  FilteredList
//
//  Created by Natasha Godwin on 8/12/21.
//

import SwiftUI
import CoreData

@main
struct FilteredListApp: App {
	let persistenceContainer = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
					.environment(\.managedObjectContext, persistenceContainer.container.viewContext)
        }
    }
}
