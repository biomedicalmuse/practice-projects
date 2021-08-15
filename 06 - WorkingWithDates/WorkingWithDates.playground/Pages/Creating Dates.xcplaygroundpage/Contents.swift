import SwiftUI


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

// Find the first Friday of June
let donutDay2020Components = DateComponents(
  year: 2021,
  month: 6,
  weekday: 6, // Gregorian Calendar starts on Sunday
  weekdayOrdinal: 1
)

let donutDay2021Date = Calendar.current.date(from: donutDay2020Components)!
print("Donut Day 2021 happens on \(donutDay2021Date.description(with: Locale(identifier: "en-US"))).")

// Convert Tokyo time to US EST
var makeItSuntoryTime = DateComponents(
	timeZone: TimeZone(identifier: "Asia/Tokyo")!,
	year: 2021,
	hour: 21,
	weekday: 5, // Thursday
	weekOfYear: 35
)

let suntoryMyTime = Calendar.current.date(from: makeItSuntoryTime)!
print("Let's meet for a relaxing time at \(suntoryMyTime.description(with: Locale(identifier: "en-US"))).")

// Find the 300th day of 2021
var day300 = DateComponents(
	year: 2021,
	day: 300
)

let day300Date = Calendar.current.date(from: day300)!
print("The 300th day of 2021 is \(day300Date.description(with: Locale(identifier: "en-US")))")

// Figure out when you'll finish 10,000 hours, if you start on September 1, 2021
var hoursOfSleep = 8
let daysInYear = 365
let sleepInAYear = hoursOfSleep * daysInYear

let tenThousandHours = DateComponents(
	year: 2021,
	month: 9,
	hour: 10000 + sleepInAYear
)

let expertLevelUnlocked = Calendar.current.date(from: tenThousandHours)!
print("Assuming you sleep \(hoursOfSleep) per night, you'll have clocked in 10,000 hours on \(expertLevelUnlocked.description(with: Locale(identifier: "en-US")))")

// Figure out how far behind you are in a 100-day challenge

var start = DateComponents(
	year: 2021,
	month: 4,
	hour: 10,
	minute: 0,
	second: 0,
	weekdayOrdinal: 1
)

let finish = DateComponents(
	year: 2021,
	month: 4,
	day: 100,
	hour: 10,
	minute: 0,
	second: 0,
	weekdayOrdinal: 1
)

let today = DateComponents(
	year: 2021,
	month: 8,
	day: 15,
	hour: 12,
	minute: 3,
	second: 0
)

let startDate = Calendar.current.date(from: start)!
let finishDate = Calendar.current.date(from: finish)!
let todaysDate = Calendar.current.date(from: today)!
let overtime = today.month! - finish.month!

print("""
	You started your 100-day challenge on \(startDate.description(with: Locale(identifier: "en-US"))), with a planned end date of \(finishDate.description(with: Locale(identifier: "en-US"))).
	Today is \(todaysDate.description(with: Locale(identifier: "en-US"))).
   You are \(overtime) months behind.
""")


// What if you created an impossible date, like September 50th, 2021?

var september50th = DateComponents(
	year: 2021,
	month: 9,
	day: 50
)

let september50thDate = Calendar.current.date(from: september50th)!
// Answer: It adds 50 days to the start of September.
print("The 50th of September is actually \(september50thDate.description(with: Locale(identifier: "en-US"))).")


// Extracting DateComponents from a Date

let todayComponents = Calendar.current.dateComponents([.year, .month, .day], from: Date())

print("Today is \(todayComponents.month!)/\(todayComponents.day!)/\(todayComponents.year!).")


/*
Summary

Date represents a single point in time, expressed as the number of seconds before or after January 1, 2001 00:00:00 UTC. This format makes it easy to translate into any calendar or time system.
DateComponents represents a point in time or a duration of time, expressed in units, like year, month, and day. It is the easiest way to create or find a date.
Calendar provides a context when converting between Date and DateComponents.
Apple supports 16 different calendar systems. You can use Calendar.current to get the user's calendar, so dates are formatted in a way that makes sense to them. 

To create a date, using DateComponents:
 Calendar.current.date(from: DateComponents)!

To get the DateComponents from a date:
 Calendar.current.dateComponents(_, from: Date())!

*/


