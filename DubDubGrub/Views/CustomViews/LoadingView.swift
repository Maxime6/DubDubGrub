//
//  LoadingView.swift
//  DubDubGrub
//
//  Created by Maxime Tanter on 15/07/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .opacity(0.9)
                .ignoresSafeArea()
            
            ProgressView()
                .progressViewStyle(.circular)
                .tint(.brandPrimary)
                .scaleEffect(2)
                .offset(y: -40)
        }
    }
}

#Preview {
    LoadingView()
}
