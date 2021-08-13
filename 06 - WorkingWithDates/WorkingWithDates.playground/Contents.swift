import SwiftUI

/*
 NOTES

What is Date?
A struct that represents a single point in time, expressed as seconds relative to the beginning of the Third Millenium (January 1, 2001 00:00:00 UTC).
It's used to represent dates and times, but it's independent of any time zone or calendar system. You have to use other objects to convert it to the appropriate calendar, time zone, and format.

What is Calendar?
A struct that specifies which calendar is being used for Date structs. It supports 16 different calendar systems
Calendar provides context that makes creating and working with Dates easier. You can tell time using familiar time units instead of seconds relative to January 1, 2001 00:00:00 UTC).

Calendar is also used to convert Date to DateComponents and vice versa.

Date -> Calendar -> DateComponents
DateComponents -> Calendar -> Date

What is DateComponents?
A struct that expresses time in discrete units, like year, month, day, hour, minute, and more.
Used to represent a point in time or a duration of time.

What does Date's description property do?

What does Date's description(with:) method do?

*/

// Calculating the amount of time between now and Apple's reference date (January 1, 2001 00:00:00)
let now = Date()
print("It's been \(now.timeIntervalSinceReferenceDate) seconds since the start of the Third Millenium.")

// You can format dates with the description property
print(now.description)
print(now.description(with: Locale(identifier: "en-US")))
print(now.description(with: Locale(identifier: "en-GB")))
print(now.description(with: Locale(identifier: "es")))
print(now.description(with: Locale(identifier: "zh-Hans")))


/*
Creating Dates: The Tedious Edition

1. Date(timeIntervalSinceNow:) creates a Date that is relative to today
2. Date(timeIntervalSinceReferenceDate:) creates a Date relative to Swift's reference date (January 1, 2001 00:00:00 UTC), expressed as a TimeInterval
3. Date(timeIntervalSince1970): creates a Date relative to Unix's reference date (January 1, 1970 00:00:00). This is used for compatibility with the Unix operating system.
4. Date(timeInterval: since:): creates a Date relative to another

All of the above are expressed as seconds, with negative values for the past and positive ones for the future.

That makes them extremely difficult to work with.
*/

// Date(timeIntervalSinceNow:)
let fiveMinutesAgo = Date(timeIntervalSinceNow: -5 * 60)
let fiveMinutesFromNow = Date(timeIntervalSinceNow: 5 * 60)
let fiveHoursAgo = Date(timeIntervalSinceNow: -5 * 60 * 60)
let fiveHoursFromNow = Date(timeIntervalSinceNow: 5 * 60 * 60)
let fiveDaysFromNow = Date(timeIntervalSinceNow: 5 * 60 * 60 * 24)
let fiveWeeksFromNow = Date(timeIntervalSinceNow: 5 * 60 * 60 * 24 * 5)

// Date(timeIntervalSinceReferenceDate:)
let firstCellularCall = Date(timeIntervalSinceReferenceDate: -875_602_800)

// Date(timeIntervalSince1970):
let oneYear = TimeInterval(60 * 60 * 24 * 365)
let newYears1971 = Date(timeIntervalSince1970: oneYear)
let newYears1969 = Date(timeIntervalSince1970: -oneYear)


// Date(timeInterval: since:)
let twoYears = TimeInterval(oneYear * 2)
let diagnosis = Date(timeInterval: -twoYears, since: Date())


// Creating Dates: The Sensible Edition
// Calendar and DateComponents make it easier to create dates.

let calendar = Calendar.current // the user's calendar

// 1. Douglas Englebart published "Augmenting Human Intellect" in October 1962.

let englebartPublication = DateComponents(calendar: nil, timeZone: TimeZone(secondsFromGMT: -18000), era: nil, year: 1962, month: 10, day: nil, hour: nil, minute: nil, second: nil, nanosecond: nil, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil)

let englebartPublicationDate = calendar.date(from: englebartPublication)!

print("Douglas Engelbart published 'Augmenting Human Intellect' on \(englebartPublicationDate.description(with: Locale(identifier: "en-US"))).")

// 2. Douglas Englebart delivered his "The Mother of All Demos" presentation, demonstrating the GUI, mouse, keyboard, hypertext links, and collaborative document editing, on December 9, 1968.

let motherOfAllDemos = DateComponents(
	timeZone: TimeZone(identifier: "America/Los_Angeles"),
	year: 1968,
	month: 12,
	day: 9,
	hour: 15,
	minute: 45
)

let motherOfAllDemosDate = calendar.date(from: motherOfAllDemos)!

print("Douglas Englebart delivered 'The Mother of All Demos' on \(motherOfAllDemosDate.description(with: Locale(identifier: "en-US"))).")

// 3. Here's how to create a date, using DateComponents, step-by-step.
var components = DateComponents()

components.year = 2019
components.month = 3
components.day = 21
components.timeZone = TimeZone(abbreviation: "EST")

let diagnosisDate = calendar.date(from: components)!

print("I was diagnosed on \(diagnosisDate.description(with: Locale(identifier: "en-US"))).")

// 4. You can also use DateComponents to find a date.

let donutDay2020Components = DateComponents(
  year: 2021,
  month: 6,
  weekday: 6, // The Gregorian Calendar starts on Sunday.
  weekdayOrdinal: 1 // first Friday
)

let donutDay2021Date = Calendar.current.date(from: donutDay2020Components)!
print("Donut Day 2021 happens on \(donutDay2021Date.description(with: Locale(identifier: "en-US"))).")

