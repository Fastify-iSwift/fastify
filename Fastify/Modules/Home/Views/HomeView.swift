//
//  HomeView.swift
//  Fastify
//
//  Created by Andira Yunita on 26/03/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var fastingVM = FastingViewModel()
    
    var body: some View {
        VStack(spacing: 56) {
            Text(fastingVM.fastingState == .fasting ? "You're Fasting" : "")
                .font(.title)
                .fontWeight(.bold)
            
            ProgressCircle()
                .environmentObject(fastingVM)
            
            Button {
                fastingVM.toggleFastingState()
            } label: {
                Text(fastingVM.fastingState == .fasting ? "END" : "START")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 8)
            }
        }
    }
}

#Preview {
    HomeView()
}
