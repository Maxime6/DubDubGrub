//
//  AppTabView.swift
//  DubDubGrub
//
//  Created by Maxime Tanter on 29/05/2024.
//

import SwiftUI

struct AppTabView: View {
    var body: some View {
        TabView {
            LocationMapView()
                .tabItem {
                    Label("Map", systemImage: "map")
                }
            
            LocationListView()
                .tabItem {
                    Label("Locations", systemImage: "building")
                }
            
            NavigationStack {
                ProfileView()
            }
            .tabItem {
                Label("Profile", systemImage: "person")
            }
        }
        .onAppear {
            CloudKitManager.shared.getUserRecord()
        }
        .tint(.brandPrimary)
    }
}

#Preview {
    AppTabView()
}
