//
//  ContentProviderTests.swift
//  ToDoListUnitTests
//
//  Created by Дарья Леонова on 26.06.2022.
//

import XCTest
@testable import ToDoList

class ContentProviderTests: XCTestCase {
    var contentProvider: ToDoListContentProvider!
    var dataManager: DataManagerMock!
    
    override func setUp() {
        super.setUp()
        
        dataManager = DataManagerMock()
        contentProvider = ToDoListContentProvider(dataManager: dataManager)
    }
    
    override func tearDown() {
        contentProvider = nil
        dataManager = nil
        super.tearDown()
    }
    
    func testGetTask_forId() {
        // Given
        let task = TaskModelsMockProvider.tasks.first!
        let id = task.id
        
        // When
        let fetchingTask = contentProvider.getTask(for: id)
        
        // Then
        XCTAssert(fetchingTask?.id == task.id, "GetTask_forId Error. Incorrect task")
    }
    
    func testDeleteTasks() {
        
    }
}
