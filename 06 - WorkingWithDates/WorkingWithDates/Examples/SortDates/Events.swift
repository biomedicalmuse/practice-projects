//
//  Events.swift
//  WorkingWithDates
//
//  Created by Natasha Godwin on 8/22/21.
//

import Foundation

struct Event: Identifiable {
	var id = UUID()
	var date: Date
}

class EventList: ObservableObject {
	@Published var list = [Event]()
	
	func add(event: Event) {
		list.append(event)
	}
	
	func ascendingSort() {
		list.sort(by: { $0.date < $1.date })
	}
	
	func descendingSort() {
		list.sort(by: { $0.date > $1.date })
	}
	
	
	static func generateDates(range: ClosedRange<Int>) -> EventList {
		let events = EventList()
		for _ in range {
			let randomYear = Int.random(in: 2015...2021)
			let randomMonth = Int.random(in: 1...12)
			let randomDay = Int.random(in: 1...30)
			let randomHour = Int.random(in: 1...24)
			let randomMinute = Int.random(in: 1...60)
			
			let event = Event(date: Date(year: randomYear, month: randomMonth, day: randomDay, hour: randomHour, minute: randomMinute))
			
			events.add(event: event)
		}
		return events
	}
}



