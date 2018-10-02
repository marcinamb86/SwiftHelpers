//
//  ModelTests.swift
//  SwiftHelpersTests
//
//  Created by Marcin Ambrochowicz on 02/10/2018.
//  Copyright © 2018 Marcin Ambrochowicz. All rights reserved.
//

import XCTest
import CoreData

@testable
import SwiftHelpers

class ModelTests : SwiftHelpersTests {
    
    override func setUp() {
        super.setUp()
        
        model = try! Model("ModelTests", managedObjectModelName: "ModelTests", bundle: testsBundle)
    }
    
    func testManagedObjectModelNotFound() {
        XCTAssertThrowsError(_ = try Model("ModelTests", managedObjectModelName: "ModelIncorrectTests", bundle: testsBundle)) { (error) in
            XCTAssert((error as? ModelError) == ModelError.managedObjectModelNotFound)
        }
    }
    
    func testInsertNewObject() {
        let entity = NSEntityDescription.insertNewObject(type: Entity.self, into: model.persistentContainer.viewContext)
        XCTAssert(entity.isInserted)
    }
    
    func testSaveIfNeeded() {
        let context = model.persistentContainer.viewContext
        
        let entity = NSEntityDescription.insertNewObject(type: Entity.self, into: context)
        entity.attribute1 = "Test"
        try? context.saveIfNeeded()
    }
    
    private var model: Model!

}
