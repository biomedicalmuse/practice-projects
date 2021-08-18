

// Data

extension Date {
	init(year: Int, month: Int, day: Int, hour: Int, minute: Int) {
		var components = DateComponents()
		components.year = year
		components.month = month
		components.day = day
		components.hour = hour
		components.minute = minute
		self = Calendar.current.date(from: components)!
	}
	
	var getString: String {
		let formatter = DateFormatter()
		formatter.dateStyle = .long
		formatter.timeStyle = .short
		return formatter.string(from: self)
	}
}

extension DateComponents {
	var getDate: Date {
		return Calendar.current.date(from: self)!
	}
}

func getComponents(dataset: [Date]) -> [DateComponents] {
	var components = [DateComponents]()
	for data in dataset {
		let date = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: data)
		components.append(date)
	}
	return components
}

