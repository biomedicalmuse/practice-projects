//
//  Persistence.swift
//  FilteredList
//
//  Created by Natasha Godwin on 8/12/21.
//

import CoreData

struct PersistenceController {
	static let shared = PersistenceController()
	let container: NSPersistentContainer
	
	init() {
		container = NSPersistentContainer(name: "FilteredList")
		container.loadPersistentStores { (storeDescription, error) in
			if let error = error as NSError? {
				fatalError("\(error)")
			}
		}
	}
}


