//
//  ContentView.swift
//  DataFlow
//
//  Created by Natasha Godwin on 7/14/21.
//

import SwiftUI

struct ProgressBar: View {
	@Binding var value: Float
	var body: some View {
		GeometryReader { geometry in
			ZStack(alignment: .leading) {
				Rectangle()
					.frame(width: geometry.size.width, height: geometry.size.height)
					.opacity(0.5)
					.foregroundColor(Color(UIColor.systemTeal))
				Rectangle()
					 .frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
					 .animation(.linear)
					 .foregroundColor(.blue)
			}
			.cornerRadius(50)
		}
	}
}

struct UpdateProgressView: View {
	@State private var progress: Float = 0.0
	var body: some View {
		HStack {
			ProgressBar(value: $progress)
				.frame(height: 10)
			Spacer()
			Stepper("Progress", value: $progress, in: 0...100, step: 0.1)
				.labelsHidden()
		}
	}
}

struct ListView: View {
	let books = ["Complexity: A Guided Tour", "Chaos", "Network Medicine", "A First Course In Network Science", "Liminal Thinking"]
    var body: some View {
		NavigationView {
			List {
				ForEach(books, id: \.self) { book in
					VStack(alignment: .leading) {
						Text(book)
						UpdateProgressView()
					}
				}
			}
			.navigationTitle("Books")
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ListView()
    }
}
