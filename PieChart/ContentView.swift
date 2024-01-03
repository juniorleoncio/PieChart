//
//  ContentView.swift
//  PieChart
//
//  Created by leoncio junior on 03/01/24.
//

import SwiftUI
import Charts

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Chart {
                    ForEach(MockData.revenueStreams) { stream in
                        SectorMark(angle: .value("Stream", stream.value), angularInset: 1.0)
                            .foregroundStyle(by: .value("Name", stream.name))
                        
                    }
                }
                .chartLegend(.hidden)
                .frame(width: 300, height: 300)
            }
            .padding()
            .navigationTitle("Revenue")
            
            Spacer()
        }
        
    }
}

#Preview {
    ContentView()
}

struct RevenueStream: Identifiable {
    let id = UUID()
    let name: String
    let value: Double
}

struct MockData {
    static var revenueStreams: [RevenueStream] = [
    
        .init(name: "Adsense", value: 806),
        .init(name: "Courses", value: 17855),
        .init(name: "Sponsors", value: 4004),
        .init(name: "Consulting", value: 2500)
    ]
}
