//
//  VDashLine.swift
//  Fastify
//
//  Created by Riza Adi Kurniawan on 06/04/24.
//

import SwiftUI

struct VDashLine: View {
    var body: some View {
        VLineShape()
            .stroke(style: StrokeStyle(lineWidth: 2, dash: [2]))
            .foregroundStyle(Color(red: 217/255, green: 217/255, blue: 217/255))
            .frame(width: 2)
    }
}

struct VLineShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        }
    }
}

#Preview {
    VDashLine()
}
