//
//  Model.swift
//  SwiftHelpers
//
//  Created by Marcin Ambrochowicz on 02/10/2018.
//  Copyright © 2018 Marcin Ambrochowicz. All rights reserved.
//

import Foundation
import CoreData

public struct Model {
    
    public init(_ name: String = "Database", managedObjectModelName: String = "Database", bundle: Bundle = Bundle.main) throws {
        guard let momPath = bundle.path(forResource: managedObjectModelName, ofType: "momd") else {
            throw ModelError.managedObjectModelNotFound
        }
        
        let mom = NSManagedObjectModel(contentsOf: URL(fileURLWithPath: momPath))!
        
        persistentContainer = NSPersistentContainer(name: name, managedObjectModel: mom)
        persistentContainer.loadPersistentStores { (persistentStoreDescription, error) in
            print(persistentStoreDescription)
            print(error as Any)
        }
    }
    
    public let persistentContainer: NSPersistentContainer
    
}

public enum ModelError : Error {
    case managedObjectModelNotFound
}

extension NSManagedObjectContext {
    
    public func saveIfNeeded() throws {
        if hasChanges {
            try save()
        }
    }
    
}

extension NSEntityDescription {
    
    public class func insertNewObject<T : NSManagedObject>(type: T.Type, into context: NSManagedObjectContext) -> T {
        let entityName = NSStringFromClass(type)
        
        return NSEntityDescription.insertNewObject(forEntityName: entityName, into: context) as! T
    }
    
}
