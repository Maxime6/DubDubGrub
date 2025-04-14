//
//  CKRecord+Ext.swift
//  DubDubGrub
//
//  Created by Maxime Tanter on 03/06/2024.
//

import Foundation
import CloudKit

extension CKRecord {
    
    func convertToDDGLocation() -> DDGLocation {
        DDGLocation(record: self)
    }
    
    func convertToDDGProfile() -> DDGProfile {
        DDGProfile(record: self)
    }
}
