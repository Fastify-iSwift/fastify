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
        endTime.timeIntervalSince(startTime)
    }
    
    var dateFormatter: DateComponentsFormatter {
        let df = DateComponentsFormatter()
        df.allowedUnits = [.hour,.minute,]
        df.unitsStyle = .spellOut
        df.zeroFormattingBehavior = .pad
        
        
        return df
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Total Time")
                    .font(.headline)
                    .padding()
                
                Text(dateFormatter.string(from: totalTime) ?? "")
                    .font(.system(size: 48))
                    .fontWeight(.semibold)
                
                DatePicker("Start", selection: $startTime, displayedComponents: .hourAndMinute)
                    .fontWeight(.medium)
                
                DatePicker("End", selection: $endTime, displayedComponents: .hourAndMinute)
                    .padding(.bottom, 20)
                    .fontWeight(.medium)
                
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
