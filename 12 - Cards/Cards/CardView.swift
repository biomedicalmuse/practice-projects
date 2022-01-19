//
//  CardView.swift
//  Cards
//
//  Created by Natasha Godwin on 1/19/22.
//

import SwiftUI

struct CardView: View {
	let card: Card
    var body: some View {
		 VStack {
			 VStack {
				 Text("Ideas")
					 .font(.title)
					 .foregroundColor(.white)
					 .bold()
				 Divider()
				 Spacer()
				 Text(card.content)
					 .font(.system(size: 20))
					 .foregroundColor(.white)
					 .multilineTextAlignment(.center)
					 .padding(.horizontal)
				 Spacer()
			 }
		 }
		 .padding()
		 .background(card.color)
		 .clipShape(RoundedRectangle(cornerRadius: 20))
		 .frame(width: 300, height: 330)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
		 CardView(card: Card.example)
    }
}
