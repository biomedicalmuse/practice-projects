import Foundation
import SwiftUI

/*
 BASICS
*/

// Format dates
let formatter = DateFormatter()
formatter.dateStyle = .long
formatter.timeStyle = .none

// Create a Date from DateComponents
let components = DateComponents(
	year: 2021,
	month: 8,
	day: 17
)
let dateFromComponents = Calendar.current.date(from: components) ?? Date()

// Get DateComponents from a Date
let today = Date()
let todaysComponents = Calendar.current.dateComponents([.year, .month, .day], from: today)

// Calculate the amount of time between dates
let pastComponents = DateComponents(
	year: 2018,
	month: 3,
	day: 29
)
let pastDate = Calendar.current.date(from: pastComponents)!
let timeInterval = Calendar.current.dateComponents([.year], from: pastDate, to: Date())
print("It has been \(timeInterval.year!) years.")

// Find a date by adding or subtracting time
let futureTime = Calendar.current.date(byAdding: .day, value: 100, to: Date())
print("In 100 days, it will be \(formatter.string(from: futureTime!))")

/*
 ADVANCED
*/

/*
Write an extension on Date that makes it easier to ...
   1. Create a Date with DateComponents
	2. Get DateComponents from a Date
   3. Turn a Date into a String, with different styling options
*/

extension Date {
	init(timeZone: TimeZone = TimeZone(abbreviation: "EST")!, year: Int, month: Int, day: Int, hour: Int = 0, minute: Int = 0, second: Int = 0) {
		var components = DateComponents()
		components.timeZone = timeZone
		components.year = year
		components.month = month
		components.day = day
		components.hour = hour
		components.minute = minute
		components.second = second
		self = Calendar.current.date(from: components)!
	}
	
	func getComponents() -> DateComponents {
		return Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self)
	}
	
	func getString(dateStyle: DateFormatter.Style = .long, timeStyle: DateFormatter.Style = .short) -> String {
		let formatter = DateFormatter()
		formatter.dateStyle = dateStyle
		formatter.timeStyle = timeStyle
		return formatter.string(from: self)
	}
}

let date = Date(year: 2021, month: 11, day: 1)
let dateToString = date.getString(dateStyle: .long, timeStyle: .none)
let dateToComponents = date.getComponents()

/*
Write an extension on DateComponents that makes it easier to ...
   1. Get a Date from DateComponents
	1. Get the amount of time since a Date
	2. Get the amount of time until a Date
*/

extension DateComponents {
	func getDate() -> Date {
		return Calendar.current.date(from: self)!
	}
}


// Write a function that returns a random date

func getRandomDate(numberOfDates: ClosedRange<Int>) -> [Date] {
	var dates = [Date]()
	
	for _ in numberOfDates {
		let randomYear = Int.random(in: 2015...2021)
		let randomMonth = Int.random(in: 1...12)
		let randomDay = Int.random(in: 1...30)
		let randomHour = Int.random(in: 1...24)
		let randomMinute = Int.random(in: 1...60)
		
		let date = Date(year: randomYear, month: randomMonth, day: randomDay, hour: randomHour, minute: randomMinute)
		
		dates.append(date)
	}
	
	return dates
}

let dateCollection = getRandomDate(numberOfDates: 1...10)

for date in dateCollection {
	print(date.getString())
}








