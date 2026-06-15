//
//  ContentView.swift
//  PracticeProjectA
//
//  Created by Kenlon Jamone Jones Jr. on 6/15/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "cloud.sun.fill")
                .symbolRenderingMode(
                    .multicolor
                )
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, Kenlon!")
                .font(.largeTitle)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
