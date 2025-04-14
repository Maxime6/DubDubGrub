//
//  Constants.swift
//  DubDubGrub
//
//  Created by Maxime Tanter on 03/06/2024.
//

import Foundation
import UIKit

enum Recordtype {
    static let location = "DDGLocation"
    static let profile = "DDGProfile"
}

enum PlaceholderImage {
    static let avatar = UIImage(named: "default-avatar")!
    static let square = UIImage(named: "default-square-asset")!
    static let banner = UIImage(named: "default-banner-asset")!
}

enum ImageDimension {
    case square, banner
    
    static func getPlaceholder(for dimension: ImageDimension) -> UIImage {
        return dimension == .square ? PlaceholderImage.square : PlaceholderImage.banner
    }
}
