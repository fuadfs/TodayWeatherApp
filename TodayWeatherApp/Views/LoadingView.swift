//
//  LoadingView.swift
//  TodayWeatherApp
//
//  Created by Fuad Fadlila Surenggana on 30/04/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    LoadingView()
        .preferredColorScheme(.dark)
}
