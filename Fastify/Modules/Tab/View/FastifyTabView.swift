//
//  FastifyTabView.swift
//  Fastify
//
//  Created by Andira Yunita on 26/03/24.
//

import SwiftUI

struct FastifyTabView: View {
    var body: some View {
        TabView {
            // MARK: Home
            HomeView()
                .tabItem {
                    Label("Fasting", systemImage: "clock.circle")
                }
            
            // MARK: History
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.red)
                Text("History Page")
            }
            .tabItem {
                Label("History", systemImage: "calendar.circle")
            }
            
            // MARK: Settings/Profile
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(.indigo)
                Text("Settings Page")
            }
            .tabItem {
                Label("Settings", systemImage: "gear.circle")
            }
        }
        .tint(.primaryMain)
    }
}

#Preview {
    FastifyTabView()
}
