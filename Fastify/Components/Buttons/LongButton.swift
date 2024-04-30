//
//  LongButton.swift
//  Fastify
//
//  Created by Andira Yunita on 30/04/24.
//

import SwiftUI

struct LongButton: View {
    var action: () -> Void
    @State var isFasting: Bool
    var title: String?
    
    var body: some View {
        Button(action: {
            self.action()
            self.isFasting.toggle()
        }) {
            Text((isFasting ? "End Fasting" : title) ?? "")
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
    LongButton(action: {}, isFasting: false, title: "Add Fasting")
        .previewLayout(.fixed(width: 300, height: 60))
}
#endif
