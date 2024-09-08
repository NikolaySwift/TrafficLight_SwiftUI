//
//  ContentView.swift
//  TrafficLight
//
//  Created by NikolayD on 08.09.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var buttonText = "START"
    
    @State private var nextLight: TrafficLight = .red
    
    @State private var redLightIsOn = false
    @State private var yellowLightIsOn = false
    @State private var greenLightIsOn = false
    
    var body: some View {
        ZStack {
            Color(.secondarySystemBackground)
                .ignoresSafeArea()
            VStack {
                TrafficLightCircleView(
                    diameter: 120,
                    color: .red,
                    isOn: redLightIsOn
                )
                TrafficLightCircleView(
                    diameter: 120,
                    color: .yellow,
                    isOn: yellowLightIsOn
                )
                TrafficLightCircleView(
                    diameter: 120,
                    color: .green,
                    isOn: greenLightIsOn
                )
                
                Spacer()
                
                Button(action: buttonAction) {
                    Text(buttonText)
                        .font(.largeTitle)
                        .bold()
                }
                .frame(width: 200, height: 80)
                .foregroundStyle(.white)
                .background(.tint)
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                .overlay(
                    RoundedRectangle(cornerRadius: 25.0)
                        .stroke(Color.white, lineWidth: 4)
                )
                .shadow(radius: 10)
            }
            .padding()
        }
    }
    
    private func buttonAction() {
        if buttonText == "START" {
            buttonText = "NEXT"
        }
        
        switch nextLight {
        case .red:
            nextLight = .yellow
            greenLightIsOn = false
            redLightIsOn.toggle()
        case .yellow:
            nextLight = .green
            redLightIsOn.toggle()
            yellowLightIsOn.toggle()
        case .green:
            nextLight = .red
            yellowLightIsOn.toggle()
            greenLightIsOn.toggle()
        }
    }
}

// MARK: - Enum TrafficLight
extension ContentView {
    private enum TrafficLight {
        case red
        case yellow
        case green
    }
}

#Preview {
    ContentView()
}
