
//  CardHistory.swift
//  Fastify
//
//  Created by irfan wahendra on 30/04/24.
//

import SwiftUI

struct CardHistory: View {
    @State private var startTime = Date()
    @State private var endTime = Date()
    
    var body: some View {
        VStack(){
            HStack{
                Image(systemName: "clock")
                    .font(.system(size: 20))
                Text(formatDate(startTime))
                Spacer()
                HStack(alignment: .center, spacing: 8){
                    Text(formatDuration(startTime, endTime))
                        .font(.system(size: 17))
                        .fontWeight(.semibold)
                }
                .foregroundColor(.primaryMain)
                .padding(8)
                .background(Color(red: 0, green: 0.5, blue: 0.5).opacity(0.1))
                .cornerRadius(8)
                
            }
            
            TimelineView(startTime: $startTime, endTime: $endTime)
                .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4))
            
        }
    }
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, dd MMM yyyy"
        return formatter.string(from: date)
    }
    
    private func formatDuration(_ startTime: Date, _ endTime: Date) -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .short
        formatter.allowedUnits = [.hour, .minute]
        return formatter.string(from: startTime, to: endTime) ?? ""
    }
}

#Preview {
    CardHistory()
}
