//
//  TaskListViewModelTests.swift
//  ToDoListUnitTests
//
//  Created by Дарья Леонова on 26.06.2022.
//

import XCTest
import SwiftUI
@testable import ToDoList

class TaskListViewModelTests: XCTestCase {
    var viewModel: TaskListViewModel!
    var contentProvider: ContentProviderMock!

    override func setUp() {
        super.setUp()
        
        contentProvider = ContentProviderMock()
        viewModel = TaskListViewModel(contentProvider: contentProvider)
    }
    
    override func tearDown() {
        contentProvider = nil
        viewModel = nil
        super.tearDown()
    }
    
    func testDeleteTasks() {
        // Given
        let offset = IndexSet(integer: 0)
        let tasksCount = viewModel.tasksViewModel.count
        
        // When
        viewModel.deleteTasks(offsets: offset)
        
        // Then
        XCTAssert(tasksCount - 1 == viewModel.tasksViewModel.count, "Deletion error")
    }
}
