//
//  ChartView.swift
//  OpeninApp
//
//  Created by Avi Kheni on 05/05/24.
//

import SwiftUI
import Charts


struct ChartView: View {

    var jsonData: String
    @State private var chartData: [ChartData] = []

private var areaBackground: Gradient {
    Gradient(colors: [Color.accentColor, Color.accentColor.opacity(0.1)])
}

var body: some View {
    VStack(alignment: .leading) {
    
        Text(TitleText.overView.rawValue)
            .font(.headline)
            .foregroundStyle(.gray)
            .padding()

        
        //MARK:  Line chart view
        
        Chart(chartData) {
            LineMark(
                x: .value("Hour", $0.hour),
                y: .value("Value", $0.value)
            )
            .symbol(.circle)
            .interpolationMethod(.catmullRom)

            AreaMark(
                x: .value("Hour", $0.hour),
                y: .value("Value", $0.value)
            )
            .interpolationMethod(.catmullRom)
            .foregroundStyle(areaBackground)
        }
        
        .chartXAxis {
            AxisMarks(preset: .extended,values: .automatic) { value in
                AxisValueLabel("\(value.index)")
                    .foregroundStyle(.blue)
            }
        }
        
        
        .chartYScale(domain: 0 ... chartData.count) // Update the domain as per your data range
        .frame(height: 300)
        .padding()
    }
    .background(RoundedRectangle(cornerRadius: 16).fill(Color.white).shadow(radius: 8))
    
    .padding()
    .onAppear {
        do {
            let jsonData = jsonData.data(using: .utf8)!
            chartData = try JSONDecoder().decode([String: Int].self, from: jsonData)
                .sorted(by: { $0.key < $1.key })
                .map { ChartData(hour: $0.key, value: $0.value) }
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
}
}



#Preview {
    ChartView(jsonData:  """
    {
        "00:00": 1,
        "01:00": 4,
        "02:00": 0,
        "03:00": 0,
        "04:00": 0
       
}
""")
}
