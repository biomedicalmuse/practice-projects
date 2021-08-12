//
//  Note+CoreDataProperties.swift
//  FilteredList
//
//  Created by Natasha Godwin on 8/12/21.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var date: Date?
    @NSManaged public var content: String?
	
	public var wrappedDate: Date {
		date ?? Date()
	}
	
	public var formattedDate: String {
		let formatter = DateFormatter()
		formatter.dateStyle = .long
		return formatter.string(from: wrappedDate)
	}
	
	public var wrappedContent: String {
		content ?? ""
	}

}

// MARK: Generated accessors for category
extension Note {

    @objc(addCategoryObject:)
    @NSManaged public func addToCategory(_ value: Category)

    @objc(removeCategoryObject:)
    @NSManaged public func removeFromCategory(_ value: Category)

    @objc(addCategory:)
    @NSManaged public func addToCategory(_ values: NSSet)

    @objc(removeCategory:)
    @NSManaged public func removeFromCategory(_ values: NSSet)

}

extension Note : Identifiable {

}
