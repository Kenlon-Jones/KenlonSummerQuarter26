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
            // Image Element
            Image(systemName: "cloud.sun.fill")
                // Fill in color for image
                .symbolRenderingMode(.multicolor)
                // Resize image bigger
                .imageScale(.large)
                // ???
                .foregroundStyle(.tint)
            
            Image("Kenlon")
                // Make the image resizable
                .resizable()
                // Fill the frame with the image
                .scaledToFill()
                // Set the diameter of the circle
                .frame(maxWidth: 250, maxHeight: 400)
                // Crop the image into a circle
                .clipShape(Circle())
                // Create a circular overlay and shadow
                .overlay(
                    Circle()
                        .stroke(.white, lineWidth:4)
                )
            
            // The Text Element
            Text("Hello, Kenlon!")
            // The text element
                .bold()
                // Makes text bold
                .font(.largeTitle)
                // Increses font size
                .foregroundStyle(.white)
                // Recolor the text
        }
        // Adds spacing around VStack
        .padding()
        // Set the frame size of the Vstack
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        // Change background color
        .background(.blue.gradient)
    }
}

#Preview {
    ContentView()
}
