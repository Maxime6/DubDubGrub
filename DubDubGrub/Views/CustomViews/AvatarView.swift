//
//  AvatarView.swift
//  DubDubGrub
//
//  Created by Maxime Tanter on 29/05/2024.
//

import SwiftUI

struct AvatarView: View {
    
    var image: UIImage
    var size: CGFloat
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .scaledToFit()
            .frame(width: size, height: size)
            .clipShape(.circle)
    }
}

#Preview {
    AvatarView(image: PlaceholderImage.avatar, size: 90)
}
