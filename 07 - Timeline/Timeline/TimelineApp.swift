//
//  TimelineApp.swift
//  Timeline
//
//  Created by Natasha Godwin on 7/23/21.
//

import SwiftUI

@main
struct TimelineApp: App {
	@StateObject private var notes = Notes()
    var body: some Scene {
        WindowGroup {
            ContentView()
					.environmentObject(notes)
        }
    }
}
