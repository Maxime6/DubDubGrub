//
//  AlertItem.swift
//  DubDubGrub
//
//  Created by Maxime Tanter on 03/06/2024.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    
    // MARK: - MapView Errors
    static let unableToGetLocations = AlertItem(title: Text("Locations Error"),
                                            message: Text("Unable to retrieve locations at this time. \nPlease try again."),
                                            dismissButton: .default(Text("Ok")))
    
    static let locationRestricted = AlertItem(title: Text("Locations Restricted"),
                                            message: Text("Your locatoin is restricted. this may be due to parental control."),
                                            dismissButton: .default(Text("Ok")))
    
    static let locationDenied = AlertItem(title: Text("Locations Denied"),
                                            message: Text("Dub Dub Grub does not have permission to access your location. To change that go to your phone's Settings > Dub Dub Grub > Location"),
                                            dismissButton: .default(Text("Ok")))
    
    static let locationDisabled = AlertItem(title: Text("Locations Disabled"),
                                            message: Text("Your phone's location services are disabled. To change that go to your phone's Settings > Privacy > Location Services"),
                                            dismissButton: .default(Text("Ok")))
    
    // MARK: - ProfileView Errors
    static let invlaidProfile = AlertItem(title: Text("Invalid Profile"),
                                            message: Text("All fields are required as well as profile photo. Your bio must be < 100 characters. \n Please try again."),
                                            dismissButton: .default(Text("Ok")))
    
    static let noUserRecord = AlertItem(title: Text("No User Record"),
                                            message: Text("You must log into iCloud on your phone in order to utilize Dub Dub Grub's Profile. Pleas log in on your phone's settings screen."),
                                            dismissButton: .default(Text("Ok")))
    
    static let createProfileSuccess = AlertItem(title: Text("Profile created successfully"),
                                            message: Text("Your profile has successfully been created."),
                                            dismissButton: .default(Text("Ok")))
    
    static let createProfileFailure = AlertItem(title: Text("Failed to create profile"),
                                            message: Text("We were unable to create your profile at this time.\n Please try again later or contact customer support if this persists."),
                                            dismissButton: .default(Text("Ok")))
    
    static let unableToGetProfile = AlertItem(title: Text("Unable to retrieve profile"),
                                            message: Text("We were unable to retrieve your profile at this time. Please checj your internet connection and try again later or contact customer support if this persists."),
                                            dismissButton: .default(Text("Ok")))
    
    static let updateProfileSuccess = AlertItem(title: Text("Profile update success !"),
                                            message: Text("Your Dub Dub Grub profile was updated successfully."),
                                            dismissButton: .default(Text("Sweet !")))
    
    static let profileUpdateFailure = AlertItem(title: Text("Profile update failed !"),
                                            message: Text("We were unable to update your profile at this time.\nPlease try again later."),
                                            dismissButton: .default(Text("Ok")))
    
    // MARK: - LocationDetailView Errors
    static let invalidPhoneNumber = AlertItem(title: Text("Invalid phone number."),
                                            message: Text("The phone number for this location is invalid."),
                                            dismissButton: .default(Text("Ok")))
}
