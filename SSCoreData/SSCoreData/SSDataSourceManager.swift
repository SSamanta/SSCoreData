//
//  SSDataSourceManager.swift
//  SSCoreData
//
//  Created by Susim Samanta on 10/03/16.
//  Copyright © 2016 Susim Samanta. All rights reserved.
//

import UIKit
import CoreData

public class SSDataSourceManager: NSObject {
    
    func setUpCoreData(bundleIdentifier: String, modelFileName: String) {
        SSCoreDataManager.sharedInstance.modelFileName = modelFileName
        SSCoreDataManager.sharedInstance.bundleIdenitifier = bundleIdentifier
    }
    func getManagedObjectContext() -> NSManagedObjectContext {
        let managedObjectContext : NSManagedObjectContext  = SSCoreDataManager.sharedInstance.managedObjectContext!
        return managedObjectContext;
    }
    
    func getEntityWithName(name : String, managedObjectContext : NSManagedObjectContext) -> NSEntityDescription {
        let entityDescription : NSEntityDescription = NSEntityDescription.entityForName(name, inManagedObjectContext:managedObjectContext)!
        return entityDescription
    }
    
    func save() -> Bool{
        var error : NSError?
        do {
            try getManagedObjectContext().save()
        } catch let error1 as NSError {
            error = error1
        }
        if let err = error {
            print(err.localizedDescription)
            return false
        }else {
            return true
        }
    }
}
