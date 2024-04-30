//
//  TimelineView.swift
//  Fastify
//
//  Created by Riza Adi Kurniawan on 07/04/24.
//

import SwiftUI

struct TimelineView: View {
    @Binding var startTime: Date
    @Binding var endTime: Date
    var showIcons: Bool? = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: 1) {
            HStack {
                Image("svg-circle-icon")        .foregroundStyle(.successMain)
                Text("Start")
                Spacer()
                Text(startTime.formattedTime())
                if showIcons ?? true {
                    Image("svg-edit-icon")
                        .overlay {
                            DatePicker("start", selection: $startTime, displayedComponents: .hourAndMinute)
                                .fontWeight(.medium)
                                .labelsHidden()
                                .blendMode(.destinationOver)
                        }
                }
            }
            
            VDashLineView()
                .frame(height: 36)
                .padding(.leading, 5)
            
            HStack {
                Image("svg-circle-icon")        .foregroundStyle(.dangerMain)
                Text("End")
                Spacer()
                Text(endTime.formattedTime())
                if showIcons ?? true {
                    Image("svg-edit-icon")
                        .overlay {
                            DatePicker("end", selection: $endTime, displayedComponents: .hourAndMinute)
                                .fontWeight(.medium)
                                .labelsHidden()
                                .blendMode(.destinationOver)
                        }
                }
            }
        }
    }
}

#Preview {
    TimelineView(startTime: .constant(Date()), endTime: .constant(Date()))
}
