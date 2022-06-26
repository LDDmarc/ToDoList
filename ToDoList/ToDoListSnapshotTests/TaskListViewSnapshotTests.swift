//
//  TaskListViewSnapshotTests.swift
//  ToDoListSnapshotTests
//
//  Created by Дарья Леонова on 25.06.2022.
//

import XCTest
import SnapshotTesting
import SwiftUI
@testable import ToDoList

class TaskListViewSnapshotTests: SnapshotTestCase {
    func testTaskListView_empty() {
        // Given
        let viewModel = TaskListViewModelMock()
        let view = TaskListView(viewModel: viewModel)
        
        // When
        viewModel.tasksViewModel = []
        
        // Then
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12)))
    }
    
    func testTaskListView_oneTask() {
        // Given
        let viewModel = TaskListViewModelMock()
        let view = TaskListView(viewModel: viewModel)
        
        // When
        viewModel.tasksViewModel = [TaskModelsMockProvider.viewModels[0]]
        
        // Then
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12)))
    }
    
    func testTaskListView_list() {
        // Given
        let viewModel = TaskListViewModelMock()
        let view = TaskListView(viewModel: viewModel)
        
        // When
        viewModel.tasksViewModel = TaskModelsMockProvider.viewModels
        
        // Then
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12)))
    }
    
    func testTaskListView_listX2() {
        // Given
        let viewModel = TaskListViewModelMock()
        let view = TaskListView(viewModel: viewModel)
        
        // When
        viewModel.tasksViewModel = TaskModelsMockProvider.viewModels + TaskModelsMockProvider.viewModels
        
        // Then
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12)))
    }
    
    // MARK: Content view
    func testContentView_listX2() {
        // Given
        let viewModel = TaskListViewModelMock()
        let view = ContentView(viewModel: viewModel)
        
        // When
        viewModel.tasksViewModel = TaskModelsMockProvider.viewModels + TaskModelsMockProvider.viewModels
        
        // Then
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12)))
    }
}
