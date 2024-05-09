//
//  HomeView.swift
//  Fastify
//
//  Created by Andira Yunita on 26/03/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var fastingVM = FastingViewModel()
    @State private var startTime = Date()
    @State private var endTime = Date(timeIntervalSinceNow: (60 * 60))
    @State private var showAlert = false
    
    var totalTime: TimeInterval {
        guard startTime <= endTime else {
            return 0
        }
        return endTime.timeIntervalSince(startTime)
    }
    
    var body: some View {
        VStack(spacing: 56) {
            Text(fastingVM.fastingState == .fasting ? "You're Fasting" : "")
                .font(.title)
                .fontWeight(.bold)
            
            ProgressCircle()
                .environmentObject(fastingVM)
            
            if fastingVM.fastingState == .notStarted {
                TimelineView(startTime: $startTime, endTime: $endTime, showIcons: false)
            } else {
                TimelineView(startTime: $startTime, endTime: $endTime)
            }
            
            LongButton(
                action: {
                    if fastingVM.fastingState == .fasting {
                        showAlert = true
                    }
                    fastingVM.toggleFastingState()
                },
                isFasting: fastingVM.fastingState == .fasting,
                title: "Create Fasting"
            )
        }
        .padding()
        .alert("Are you sure you want to end this fasting?", isPresented: $showAlert) {
            Button("Cancel", role: .cancel) { }
            
            Button("End", role: .destructive) {
                // MARK: Handle end fasting
//                fastingVM.toggleFastingState()
            }
        }
    }
}

#Preview {
    HomeView()
}
