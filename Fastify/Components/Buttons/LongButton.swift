//
//  LongButton.swift
//  Fastify
//
//  Created by Andira Yunita on 30/04/24.
//

import SwiftUI

struct LongButton: View {
    @State var isFasting: Bool
    
    var body: some View {
        Button {
            self.isFasting.toggle()
        } label: {
            Text(isFasting ? "End Fasting" : "Start Fasting")
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(isFasting ? Color.white : Color.primaryMain)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(isFasting ? Color.primaryMain : Color.clear, lineWidth: 2)
                        )
                )
                .fontWeight(.bold)
                .foregroundStyle(isFasting ? Color.primaryMain : Color.white)
        }
    }
}

#if DEBUG
#Preview {
    Group {
        LongButton(isFasting: false)
    }
    .previewLayout(.fixed(width: 300, height: 60))
}
#endif
