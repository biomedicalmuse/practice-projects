//
//  StandardStacks.swift
//  MondrianUI
//
//  Created by Natasha Godwin on 11/16/21.
//

import SwiftUI

/*
 
 GeometryReader { geometry in
	 HStack {
		// First Column
		VStack {}.frame(width: geometry.size.width * 0.35)
		// Second Column
		VStack {}.frame(width: geometry.size.width * 0.50)
	 }
    .frame(width: geometry.size.width * 0.50, height: geometry.size.height * 0.50)
 }
 .frame(width: geometry.size.width, height: geometry.size.height)
 
 */

struct StandardStack: View {
    var body: some View {
		 GeometryReader { geometry in
			 HStack(spacing: 8) {
				 // Left Column
				 VStack(spacing: 8) {
					 Rectangle()
						 .fill(Color.red)
					 Rectangle()
						 .fill(Color.white)
				 }
				 // Right Column
				 VStack(spacing: 8) {
					 Rectangle()
						 .fill(Color.white)
					 // Inner-Left Column
					 VStack {
						 HStack {
							 VStack {
								 Rectangle()
									 .fill(Color.white)
								 HStack {
									 Rectangle()
										 .fill(Color.yellow)
									 Rectangle()
										 .fill(Color.black)
								 }
								 .frame(height: geometry.size.height * 0.02)
							 }
							 // Inner-Right Column 
							 VStack {
								 Rectangle()
									 .fill(Color.blue)
								 Rectangle()
									 .fill(Color.white)
							 }
							 .frame(width: geometry.size.width * 0.08)
						 }

					 }
				 }
				 //.frame(width: geometry.size.width * 0.50, height: geometry.size.height * 0.50)
			 }
			 .frame(width: geometry.size.width, height: geometry.size.height)
			 .background(Color.black)
			 
		 }
    }
}

struct StandardStacks_Previews: PreviewProvider {
    static var previews: some View {
        StandardStack()
    }
}
