//
//  MockData.swift
//  DubDubGrub
//
//  Created by Maxime Tanter on 30/05/2024.
//

import Foundation
import CloudKit

struct MockData {
    
    static var location: CKRecord {
        let record = CKRecord(recordType: Recordtype.location)
        record[DDGLocation.kName] = "Max's Starbucks"
        record[DDGLocation.kAddress] = "123 Main Street"
        record[DDGLocation.kDescription] = "This is the description. This is the description. This is the description. This is the description. This is the description."
        record[DDGLocation.kWebsiteURL] = "https://www.apple.com"
        record[DDGLocation.kLocation] = CLLocation(latitude: 37.331516, longitude: -121.891054)
        
        return record
    }
    
    static var profile: CKRecord {
        let record = CKRecord(recordType: Recordtype.profile)
        record[DDGProfile.kFirstName] = "Test"
        record[DDGProfile.kLastName] = "User"
        record[DDGProfile.kCompanyName] = "Company test"
        record[DDGProfile.kBio] = "This is my bio as long as posible to check UI and hope it's not too long."
        
        return record
    }
}
