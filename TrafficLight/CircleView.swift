//
//  CircleView.swift
//  TrafficLight
//
//  Created by NikolayD on 08.09.2024.
//

import SwiftUI

struct CircleView: View {
    var color: Color
    var diameter: CGFloat
    
    var body: some View {
        Circle()
            .foregroundStyle(color)
            .frame(width: diameter, height: diameter)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

#Preview {
    CircleView(color: .green, diameter: 250)
}
