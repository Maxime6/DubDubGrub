//
//  LocationDetailView.swift
//  DubDubGrub
//
//  Created by Maxime Tanter on 29/05/2024.
//

import SwiftUI

struct LocationDetailView: View {
    @ObservedObject var viewModel: LocationDetailViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            BannerImageView(image: viewModel.location.createBannerImage())
            
            HStack {
                AddressView(address: viewModel.location.address)
                
                Spacer()
            }
            .padding(.horizontal)
            
            DescriptionView(text: viewModel.location.description)
            
            ZStack {
                Capsule()
                    .frame(height: 80)
                    .foregroundStyle(Color(.secondarySystemBackground))
                
                HStack(spacing: 20) {
                    Button {
                        viewModel.getDirectionsToLocation()
                    } label: {
                        LocationActionButton(color: .brandPrimary, imageName: "location.fill")
                    }
                    
                    Link(destination: URL(string: viewModel.location.websiteURL)!, label: {
                        LocationActionButton(color: .brandPrimary, imageName: "network")
                    })
                    
                    Button {
                        
                    } label: {
                        LocationActionButton(color: .brandPrimary, imageName: "phone.fill")
                    }
                    
                    Button {
                        viewModel.callLocation()
                    } label: {
                        LocationActionButton(color: .brandPrimary, imageName: "person.fill.checkmark")
                    }
                }
            }
            .padding(.horizontal)
            
            Text("Who's here ?")
                .bold()
                .font(.title2)
            
            ScrollView {
                LazyVGrid(columns: viewModel.columns) {
                    FirstNameAvatarView(image: PlaceholderImage.avatar, firstName: "Max")
                    FirstNameAvatarView(image: PlaceholderImage.avatar, firstName: "Max")
                    FirstNameAvatarView(image: PlaceholderImage.avatar, firstName: "Max")
                    FirstNameAvatarView(image: PlaceholderImage.avatar, firstName: "Max")
                    FirstNameAvatarView(image: PlaceholderImage.avatar, firstName: "Max")
                    FirstNameAvatarView(image: PlaceholderImage.avatar, firstName: "Max")
                }
            }
            
            Spacer()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
        .navigationTitle(viewModel.location.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        LocationDetailView(viewModel: LocationDetailViewModel(location: DDGLocation(record: MockData.location)))
    }
}

struct LocationActionButton: View {
    
    var color: Color
    var imageName: String
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(color)
                .frame(width: 60, height: 60)
            
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.white)
                .frame(width: 22, height: 22)
        }
    }
}

struct FirstNameAvatarView: View {
    
    var image: UIImage
    var firstName: String
    
    var body: some View {
        VStack {
            AvatarView(image: image, size: 64)
            
            Text(firstName)
                .bold()
                .lineLimit(1)
                .minimumScaleFactor(0.75)
        }
    }
}

struct BannerImageView: View {
    
    var image: UIImage
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .scaledToFill()
            .frame(height: 120)
    }
}

struct AddressView: View {
    
    var address: String
    
    var body: some View {
        Label(address, systemImage: "mappin.and.ellipse")
            .font(.caption)
            .tint(.secondary)
    }
}

struct DescriptionView: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .lineLimit(3)
            .minimumScaleFactor(0.75)
            .frame(height: 70)
            .padding(.horizontal)
    }
}
