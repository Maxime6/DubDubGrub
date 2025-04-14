//
//  LocationMapView.swift
//  DubDubGrub
//
//  Created by Maxime Tanter on 29/05/2024.
//

import SwiftUI
import MapKit

struct LocationMapView: View {
    @EnvironmentObject private var locationManager: LocationManager
    @StateObject private var viewModel = LocationMapViewModel()
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true, annotationItems: locationManager.locations) { location in
                MapPin(coordinate: location.location.coordinate, tint: .brandPrimary)
            }
            .tint(.grubRed)
            .ignoresSafeArea()
            
            VStack {
                LogoView(frameWidth: 125)
                    .shadow(radius: 10)
                
                Spacer()
            }
        }
        .sheet(isPresented: $viewModel.isShowingOnboardView, onDismiss: viewModel.checkIfLocationServiceIsEnabled) {
            OnboardView(isShowingOnboardview: $viewModel.isShowingOnboardView)
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
        .onAppear {
            viewModel.runStartupChecks()
            if locationManager.locations.isEmpty {
                viewModel.getLocations(for: locationManager)
            }
        }
    }
}

#Preview {
    LocationMapView()
}
