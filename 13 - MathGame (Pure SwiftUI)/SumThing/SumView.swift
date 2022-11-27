//
//  SumView.swift
//  SumThing
//
//  Created by Natasha Godwin on 11/23/22.
//

import SwiftUI

struct SumView: View {
	@ScaledMetric(relativeTo: .title) var frameWidth = 50
	var number: Int
    var body: some View {
        Text(String(number))
			 .font(.title)
			 .monospacedDigit()
			 .frame(width: frameWidth, height: frameWidth)
    }
}

struct SumView_Previews: PreviewProvider {
    static var previews: some View {
		 SumView(number: 15)
    }
}
