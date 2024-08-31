//
//  newsfeed.swift
//  testapp
//
//  Created by Pixel on 30/08/24.
//

import SwiftUI

struct NewsFeedView: View {
    @State private var showHeart = false
    
    var body: some View {
        ScrollView {
            HStack(spacing: 20) {
                ForEach(0..<10) { index in
                    ZStack {
                        Image("your_image_name_here") // Replace with your image name
                            .resizable()
                            .frame(width: 50,height: 50)
                            .scaledToFit()
                            .onTapGesture {
                                withAnimation {
                                    showHeart = true
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    showHeart = false
                                }
                            }
                        
                        if showHeart {
                            HeartAnimationView()
                                .transition(.scale)
                        }
                    }
                    .frame(height: 300)
                }
            }
            .padding()
        }
    }
}

//struct ContentView: View {
//    var body: some View {
//        NewsFeedView()
//    }
//}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

