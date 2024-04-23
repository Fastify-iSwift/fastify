//
//  ProgressCircle.swift
//  Fastify
//
//  Created by Andira Yunita on 26/03/24.
//

import SwiftUI

struct ProgressCircle: View {
    @EnvironmentObject var fastingVM: FastingViewModel
    
    let timer = Timer
        .publish(every: 1, on: .main, in: .common)
        .autoconnect()
    
    var elapsedText: String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        
        let formattedString = formatter.string(from: fastingVM.elapsedTime) ?? "Invalid Interval"
        return formattedString
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 35)
                .foregroundStyle(.gray)
                .opacity(0.3)
            
            Circle()
                .trim(from: 0.0, to: min(fastingVM.progress, 1.0))
                .stroke(AngularGradient.init(gradient: Gradient(colors: [Color.primaryMain]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/), style: StrokeStyle(lineWidth: 30.0, lineCap: .round, lineJoin: .round))
                .rotationEffect(Angle(degrees: 270))
                .animation(.easeInOut(duration: 1.0), value: fastingVM.progress)
            
            VStack(spacing: 30) {
                VStack(spacing: 8) {
                    Text(elapsedText)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text(fastingVM.fastingState == .fasting ? "Fasting Time" : "Eating Time")
                        .font(.title)
                        .foregroundStyle(.neutral05)
                }
            }
        }
        .frame(width: 300, height: 300)
        .padding()
        .onReceive(timer) { _ in
            fastingVM.fastingTrack()
        }
    }
}

#Preview {
    ProgressCircle()
        .environmentObject(FastingViewModel())
}
