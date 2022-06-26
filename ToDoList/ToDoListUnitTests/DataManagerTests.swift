//
//  DataManagerTests.swift
//  ToDoListUnitTests
//
//  Created by Дарья Леонова on 26.06.2022.
//

import XCTest
@testable import ToDoList

class DataManagerTests: XCTestCase {
    var dataManager: UserDefaultsDataManager!
    
    override func setUp() {
        super.setUp()
        dataManager = UserDefaultsDataManager()
    }
    
    override func tearDown() {
        dataManager = nil
        super.tearDown()
    }
    
    func testSaveAndGet() {
        // Given
        let newTask = TaskModel(
            id: UUID().uuidString,
            name: "testSaveAndGet",
            description: "testSaveAndGet",
            priority: .critical,
            isDone: false
        )
        
        // When
        dataManager.save(model: newTask, key: .task(id: newTask.id))
        let fetchedTask = dataManager.get(type: TaskModel.self, key: .task(id: newTask.id))
        
        // Then
        XCTAssert(fetchedTask != nil, "testSaveAndGet Error. Task was not found")
        XCTAssert(fetchedTask?.name == newTask.name, "testSaveAndGet Error. Task name is incorrect")

    }
}
