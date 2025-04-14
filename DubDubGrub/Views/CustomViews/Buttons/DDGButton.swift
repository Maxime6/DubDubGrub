//
//  DDGButton.swift
//  DubDubGrub
//
//  Created by Maxime Tanter on 29/05/2024.
//

import SwiftUI

struct DDGButton: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .bold()
            .frame(width: 280, height: 44)
            .background(.brandPrimary)
            .foregroundStyle(.white)
            .clipShape(.capsule)
    }
}

#Preview {
    DDGButton(title: "DDG Button")
}
