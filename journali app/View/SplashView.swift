//
//  SplashView.swift
//  journali app
//
//  Created by Aseel2 on 29/05/1448 AH.
//

import SwiftUI

struct SplashView: View {

    @State var isActive = false

    var body: some View {
        if isActive {
            JournalListView()
        } else {
            ZStack {
                LinearGradient(
                    colors: [Color("Background"), Color("SplashMiddle"), Color("SplashBottom")],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                VStack {
                    Image("notebook")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 95)

                    Text("Journali")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.primary)

                    Text("Your thoughts, your story")
                        .foregroundStyle(.secondary)
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                    isActive = true
                }
            }
        }
    }
}

#Preview("Light") {
    SplashView()
}

#Preview("Dark") {
    SplashView()
        .preferredColorScheme(.dark)
}
