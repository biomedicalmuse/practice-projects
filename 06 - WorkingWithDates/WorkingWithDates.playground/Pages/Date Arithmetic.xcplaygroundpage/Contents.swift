//: [Previous](@previous)

import Foundation

//: [Next](@next)

let nineteenEightyNine = DateComponents(
	year: 2014,
	month: 10,
	day: 27
)

let reputation = DateComponents(
	year: 2017,
	month: 11,
	day: 10
)

let releaseDate1989 = Calendar.current.date(from: nineteenEightyNine)!
let releaseDateReputation = Calendar.current.date(from: reputation)!

// Comparing dates

print("Did Taylor Swift release Reputation before 1989?")
print("\(releaseDateReputation < releaseDate1989)") // False

print("Did Taylor Swift release Reputation after 1989?")
print("\(releaseDateReputation > releaseDate1989)") // True

print("Did Taylor Swift release Reputation and 1989 in the same year?")
print("\(reputation.year == nineteenEightyNine.year)") // false

print("Did Taylor Swift release Reputation and 1989 at the same time?")
print("\(releaseDateReputation == releaseDate1989)")

// Calculating time intervals

// Date's timeIntervalSince() method
print("Taylor Swift's album Reputation was released \(releaseDateReputation.timeIntervalSince(releaseDate1989)) seconds after 1989.")

// Calendar's dateComponents(from:, to:) method
let yearsBetweenAlbums = Calendar.current.dateComponents([.year], from: releaseDate1989, to: releaseDateReputation)
print("Taylor Swift released Reputation \(yearsBetweenAlbums.year!) years after 1989.")

let weeksBetweenAlbums = Calendar.current.dateComponents([.weekOfYear], from: releaseDate1989, to: releaseDateReputation)
print("Taylor Swift released Reputation \(weeksBetweenAlbums.weekOfYear!) weeks after 1989.")

let timeBetweenAlbums = Calendar.current.dateComponents([.year, .month, .day], from: releaseDate1989, to: releaseDateReputation)
print("Taylor Swift released Reputation \(timeBetweenAlbums.year!) years, \(timeBetweenAlbums.month!) months, and \(timeBetweenAlbums.day!) days after 1989.")


// Finding the date after adding time to an existing one

// If you start a 100-day challenge today, when will you finish?
let lastDay = Calendar.current.date(byAdding: .day, value: 100, to: Date())!
let formatter = DateFormatter()
formatter.dateStyle = .long
print("You'll finish the 100-Day Challenge on \(formatter.string(from: lastDay)).")

// What day was it five weeks ago?
let fiveWeeksAgo = Calendar.current.date(byAdding: .weekOfYear, value: -5, to: Date())!
print("\(formatter.string(from: fiveWeeksAgo)) was five weeks ago.")

// What time will it be in 5.5 hours?

var lengthOfTime = DateComponents()
lengthOfTime.hour = 5
lengthOfTime.minute = 30

let timeFromNow = Calendar.current.date(byAdding: lengthOfTime, to: Date())!
formatter.dateStyle = .none
formatter.timeStyle = .short
print("It will be \(formatter.string(from: timeFromNow)) in five and a half hours.")

// What time was it 5.5 hours ago?
lengthOfTime.hour = -5
lengthOfTime.minute = -30
let timeAgo = Calendar.current.date(byAdding: lengthOfTime, to: Date())
print("It was \(formatter.string(from: timeAgo!)) five and a half hours ago.")


// Comparing dates with different levels of precision


let date1 = DateComponents(
	timeZone: TimeZone(abbreviation: "EST"),
	year: 2021,
	month: 8,
	day: 16,
	hour: 5,
	minute: 53
)

let date2 = DateComponents(
	timeZone: TimeZone(abbreviation: "EST"),
	year: 2021,
	month: 8,
	day: 16,
	hour: 5,
	minute: 54 // a one-minute different from the first
)

let firstDate = Calendar.current.date(from: date1)!
let secondDate = Calendar.current.date(from: date2)!

let preciseTest = Calendar.current.compare(firstDate, to: secondDate, toGranularity: .minute)
print("\(preciseTest == .orderedSame)") // false
print("\(preciseTest == .orderedAscending)") // true

let lessPreciseTest = Calendar.current.compare(firstDate, to: secondDate, toGranularity: .hour)
print("\(lessPreciseTest == .orderedSame)") // true

/*
 Summary
 
You can compare two dates with comparison operators

.timeIntervalSince(Date)
A Date method calculates the difference between two dates in seconds.

dateComponents([SetComponents], from: Date, to: Date)
A Calendar method that calculates the difference between two dates in units, like years and weeks.

date(byAdding: timeInterval, value: numberOfUnits, to: startDate)
A Calendar method that adds an amount of time to a given date and returns the result.
You can use negative values to find dates in the past.

date(byAdding: timeIntervalComponents, to: startDate)
A Calendar method that adds (or subtracts) multiple time units from a date and returns the result.

compare(firstDate, to: secondDate, toGranularity: granularity)
A Calendar method that lets you compare Dates with different levels of precision.
This is useful when you want to make rough comparisons, like the number of days between two dates.
If you use comparison operators, Swift will compare down to the nanosecond.
 
*/

