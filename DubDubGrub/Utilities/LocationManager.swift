//
//  LocationManager.swift
//  DubDubGrub
//
//  Created by Maxime Tanter on 03/06/2024.
//

import Foundation

final class LocationManager: ObservableObject {
    @Published var locations: [DDGLocation] = []
}
