//
//  HistoryView.swift
//  Marsogram
//
//  Created by PowerMac on 02.09.2024.
//

import SwiftUI

struct HistoryView: View {
    @ObservedObject var coordinator: HistoryCoordinator

    var body: some View {
        VStack {
            Text(coordinator.data.titleData.title)
                .font(.largeTitle)
                .padding()
            
            List(coordinator.data.historyData.historyItems, id: \.self) { item in
                Text(item)
            }
            
            Button("Go to Home") {
                coordinator.mainCoordinator?.navigateTo(.home)
            }
            Button("Go to View Photo") {
                coordinator.mainCoordinator?.navigateTo(.viewPhoto)
            }
        }
    }
}

#Preview {
    HistoryView(coordinator: MockHistoryCoordinator())
}
