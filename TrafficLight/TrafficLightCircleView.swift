//
//  CircleView.swift
//  TrafficLight
//
//  Created by NikolayD on 08.09.2024.
//

import SwiftUI

struct TrafficLightCircleView: View {
    var diameter: CGFloat
    var color: Color
    var isOn: Bool
    
    private let lightOFF = 0.3
    private let lightOn = 1.0
    
    var body: some View {
        Circle()
            .foregroundStyle(color)
            .opacity(isOn ? lightOn : lightOFF)
            .frame(width: diameter, height: diameter)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

#Preview {
    TrafficLightCircleView(diameter: 250, color: .green, isOn: true)
}
