//
//  ExampleCRUD.swift
//  Fastify
//
//  Created by Riza Adi Kurniawan on 26/04/24.
//

import SwiftUI
import SwiftData

struct ExampleCRUD: View {
    @Query(sort: \Fasting.updatedAt, order: .reverse) private var fastings: [Fasting]
    
    @State private var selectedFasting: Fasting?
    
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Button("Add Fasting") {
                        let newFasting = Fasting(startAt: .now, endAt: .now)
                        modelContext.insert(newFasting)
                    }
                }
                Section {
                    ForEach(fastings, id: \.id) { fasting in
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Start: \(fasting.startAt.ISO8601Format())")
                                Text("End: \(fasting.endAt.ISO8601Format())")
                            }
                            Spacer()
                            
                            Button {
                                selectedFasting = fasting
                            } label: {
                                Image(systemName: "pencil.line")
                                    .foregroundStyle(.green)
                            }
                            .buttonStyle(.plain)
                            .sheet(item: $selectedFasting) { fas in
                                ExampleDetail(fasting: fas)
                            }
                            
                            Button {
                                modelContext.delete(fasting)
                            } label: {
                                Image(systemName: "trash")
                                    .foregroundStyle(.red)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
            }
            .navigationTitle("Example")
        }
    }
}

#Preview {
    ExampleCRUD()
        .modelContainer(previewContainer)
}

struct ExampleDetail: View {
    var fasting: Fasting
    
    @State private var startAt: Date
    @State private var endAt: Date
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    init(fasting: Fasting) {
        self.fasting = fasting
        self.startAt = fasting.startAt
        self.endAt = fasting.endAt
    }
    var body: some View {
        Form {
            Text(fasting.startAt.ISO8601Format())
            Text(fasting.endAt.ISO8601Format())
            
            DatePicker("Start Time", selection: $startAt , displayedComponents: .hourAndMinute)
            DatePicker("End Time", selection: $endAt, displayedComponents: .hourAndMinute)
            
            Button("Update") {
                fasting.startAt = startAt
                fasting.endAt = endAt
                
                do {
                   try modelContext.save()
                } catch {
                    print(error.localizedDescription)
                }
                dismiss()
            }
        }
    }
}
