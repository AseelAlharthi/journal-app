//
//  EmptyStateView.swift
//  journali app
//
//  Created by Aseel2 on 29/05/1448 AH.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        VStack(spacing: 12) {
            Image("emptyBook")
                .resizable()
                .scaledToFit()
                .frame(width: 150)

            Text("Begin Your Journal")
                .font(.title2)
                .bold()
                .foregroundStyle(Color("LightPurple"))

            Text("Craft your personal diary, tap the plus icon to begin")
                .fontWeight(.light)
                .foregroundStyle(.primary)
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal, 40)
    }
}

#Preview("Light") {
    EmptyStateView()
}

#Preview("Dark") {
    EmptyStateView()
        .preferredColorScheme(.dark)
}
