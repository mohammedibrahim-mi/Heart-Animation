//
//  heart.swift
//  testapp
//
//  Created by Pixel on 30/08/24.
//

import SwiftUI

struct HeartAnimationView: View {
    @State private var isTapped = false
    @State private var animationAmount: CGFloat = 1
    @State private var heartOffset: CGFloat = 0
    
    var body: some View {
        Image(systemName: "heart.fill")
            .font(.system(size: 100))
            .foregroundStyle(
                .red
                    .shadow(
                        .inner(color: .white.opacity(0.5), radius: 15, x: 20, y: 20))
                    .shadow(
                        .drop(color: .black.opacity(0.5), radius: 15, x: 20, y: 20))
            )
            .scaleEffect(animationAmount)
            .offset(y: heartOffset)
            .opacity(Double(1 - animationAmount))
            .animation(.spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0), value: animationAmount)
            .animation(.easeOut(duration: 1.0), value: heartOffset)
            .onAppear {
                animateHeart()
            }
    }
    
    private func animateHeart() {
        withAnimation {
            animationAmount = 1.5
        }
        withAnimation(.easeOut(duration: 1.0)) {
            heartOffset = -100
            animationAmount = 0.0
        }
    }
}

