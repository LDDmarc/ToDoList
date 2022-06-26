//
//  TaskViewModelTests.swift
//  ToDoListUnitTests
//
//  Created by Дарья Леонова on 25.06.2022.
//

import XCTest
@testable import ToDoList

class TaskViewModelTests: XCTestCase {
    var viewModel: TaskViewModel!
    var taskModel: TaskModelMock!

    override func setUp() {
        super.setUp()
        
        taskModel = TaskModelMock()
        viewModel = TaskViewModel(task: taskModel, updateAction: { _ in }, createAction: { _ in })
    }
    
    override func tearDown() {
        taskModel = nil
        viewModel = nil
        super.tearDown()
    }
    
    func testRollBack() {
        // Given
        let initModel = taskModel!
        
        // When
        viewModel.makeReserveCopy()
        viewModel.name = "New_name"
        viewModel.description = "New_description"
        viewModel.priority = .critical
        viewModel.isDone.toggle()
        
        // Then
        viewModel.rollBack()
        XCTAssert(viewModel.name == initModel.name, "Roll back error. Incorrect name")
        XCTAssert(viewModel.description == (initModel.description ?? ""), "Roll back error. Incorrect description")
        XCTAssert(viewModel.priority == initModel.priority, "Roll back error. Incorrect priority")
        XCTAssert(viewModel.isDone == initModel.isDone, "Roll back error. Incorrect status")
    }
}
