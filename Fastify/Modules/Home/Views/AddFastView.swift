//
//  AddFastView.swift
//  Fastify
//
//  Created by Riza Adi Kurniawan on 27/03/24.
//

import SwiftUI

struct AddFast: View {
    @State private var startTime = Date()
    @State private var endTime = Date(timeIntervalSinceNow: (60 * 60))
    
    var totalTime: TimeInterval {
        guard startTime <= endTime else {
            return 0
        }
        return endTime.timeIntervalSince(startTime)
    }
    
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Total Time")
                    .font(.headline)
                    .padding()
                
                HStack(alignment:.firstTextBaseline, spacing: 03) {
                    let (hours, minutes, seconds) = totalTime.formattedTimeFull()
                    
                    Text(hours)
                    Text("h")
                        .baselineOffset(-6)
                        .font(.system(size: 30))
                    Text(":")
                    Text(minutes)
                    Text("h")
                        .baselineOffset(-6)
                        .font(.system(size: 30))
                    Text(":")
                    Text(seconds)
                    Text("s")
                        .baselineOffset(-6)
                        .font(.system(size: 30))
                }
                    .font(.system(size: 48))
                    .fontWeight(.semibold)
                
                TimelineView(
                    startTime: $startTime,
                    endTime: $endTime
                )
                .padding(.bottom, 20)
                
                Button("Start Fasting") {
                    
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(red: 0/255, green: 128/255, blue: 128/255))
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                Spacer()
                
            }
            .padding()
            .navigationTitle("Add Time")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

#Preview {
    AddFast()
}
