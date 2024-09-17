//
//  ContentView.swift
//  ColorizedSwiftUI
//
//  Created by Данила Умнов on 17.09.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var redComponentValue = Double.random(in: 0...255)
    @State private var greenComponentValue = Double.random(in: 0...255)
    @State private var blueComponentValue = Double.random(in: 0...255)
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 25.0)
                .overlay(RoundedRectangle(cornerRadius: 25.0)
                    .stroke(Color.white, lineWidth: 4))
                .frame(height: 150)
                .padding()
                .foregroundStyle(Color(
                    red: redComponentValue/255,
                    green: greenComponentValue/255,
                    blue: blueComponentValue/255
                ))
            ColorSlider(sliderValue: $redComponentValue, color: .red)
            ColorSlider(sliderValue: $greenComponentValue, color: .green)
            ColorSlider(sliderValue: $blueComponentValue, color: .blue)
            Spacer()
        }.background(.black)
    }
}

#Preview {
    ContentView()
}

struct ColorSlider: View {
    @Binding var sliderValue: Double
    let color: Color
    var body: some View {
        HStack(spacing: 20) {
            Text(lround(sliderValue).formatted()).foregroundStyle(.white)
                .frame(width: 35)
            Slider(value: $sliderValue, in: 0...255, step: 1).tint(color)
        }.padding()
    }
}
