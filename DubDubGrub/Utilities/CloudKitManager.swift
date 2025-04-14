//
//  CloudKitManager.swift
//  DubDubGrub
//
//  Created by Maxime Tanter on 03/06/2024.
//

import Foundation
import CloudKit

final class CloudKitManager {
    
    static let shared = CloudKitManager()
    
    private init() {}
    
    var userRecord: CKRecord?
    
    func getUserRecord() {
        CKContainer.default().fetchUserRecordID { recordID, error in
            guard let recordID = recordID, error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            CKContainer.default().publicCloudDatabase.fetch(withRecordID: recordID) { userRecord, error in
                guard let userRecord = userRecord, error == nil else {
                    print(error!.localizedDescription)
                    return
                }
                
                self.userRecord = userRecord
            }
        }
    }
    
    func getLocations(completionHandler: @escaping (Result<[DDGLocation], Error>) -> Void) {
        let sortDescriptor = NSSortDescriptor(key: DDGLocation.kName, ascending: true)
        let query = CKQuery(recordType: Recordtype.location, predicate: NSPredicate(value: true))
        query.sortDescriptors = [sortDescriptor]
        
        CKContainer.default().publicCloudDatabase.perform(query, inZoneWith: nil) { records, error in
            guard error == nil else {
                completionHandler(.failure(error!))
                return
            }
            
            guard let records = records else { return }
            
            let locations = records.map { $0.convertToDDGLocation() }
            completionHandler(.success(locations))
        }
    }
    
    func batchSave(records: [CKRecord], competionHandler: @escaping (Result<[CKRecord], Error>) -> Void) {
        let operation = CKModifyRecordsOperation(recordsToSave: records)
        
        operation.qualityOfService = .userInteractive
        operation.modifyRecordsResultBlock = { result in
            switch result {
            case .success:
                print(result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        CKContainer.default().publicCloudDatabase.add(operation)
    }
    
    func save(record: CKRecord, competionHandler: @escaping (Result<CKRecord, Error>) -> Void) {
        CKContainer.default().publicCloudDatabase.save(record) { record, error in
            guard let record = record, error == nil else {
                competionHandler(.failure(error!))
                return
            }
            
            competionHandler(.success(record))
        }
    }
    
    func fetchRecord(with id: CKRecord.ID, competionHandler: @escaping (Result<CKRecord, Error>) -> Void) {
        CKContainer.default().publicCloudDatabase.fetch(withRecordID: id) { record, error in
            guard let record = record, error == nil else {
                competionHandler(.failure(error!))
                return
            }
            
            competionHandler(.success(record))
        }
    }
}
