//
//  DubDubGrubApp.swift
//  DubDubGrub
//
//  Created by Maxime Tanter on 29/05/2024.
//

import SwiftUI

@main
struct DubDubGrubApp: App {
    
    let locationManager = LocationManager()
    
    var body: some Scene {
        WindowGroup {
            AppTabView()
                .environmentObject(locationManager)
        }
    }
}
