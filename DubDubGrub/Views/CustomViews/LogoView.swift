//
//  LogoView.swift
//  DubDubGrub
//
//  Created by Maxime Tanter on 04/06/2024.
//

import SwiftUI

struct LogoView: View {
    
    var frameWidth: CGFloat
    
    var body: some View {
        Image(.ddgMapLogo)
            .resizable()
            .scaledToFit()
            .frame(width: frameWidth)
    }
}

#Preview {
    LogoView(frameWidth: 80)
}
