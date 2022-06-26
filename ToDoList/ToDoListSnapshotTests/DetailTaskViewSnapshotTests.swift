//
//  DetailTaskViewSnapshotTests.swift
//  ToDoListSnapshotTests
//
//  Created by Дарья Леонова on 25.06.2022.
//

import XCTest
import SnapshotTesting
import SwiftUI
@testable import ToDoList

class DetailTaskViewSnapshotTests: SnapshotTestCase {
    func testDetailTaskView_emptyDescription_notDone() {
        // Given
        let viewModel = TaskViewModelMock()
        let view = DetailTaskView(viewModel: viewModel, state: .none, isPresented: .constant(true))
        
        // When
        viewModel.name = "Status"
        viewModel.description = ""
        viewModel.isDone = false
        
        // Then
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12)))
    }
    
    func testDetailTaskView_emptyDescription_done() {
        // Given
        let viewModel = TaskViewModelMock()
        let view = DetailTaskView(viewModel: viewModel, state: .none, isPresented: .constant(true))
        
        // When
        viewModel.name = "Status"
        viewModel.description = ""
        viewModel.isDone = true
        
        // Then
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12)))
    }
    
    func testDetailTaskView_hasDescription() {
        // Given
        let viewModel = TaskViewModelMock()
        let view = DetailTaskView(viewModel: viewModel, state: .none, isPresented: .constant(true))
        
        // When
        viewModel.name = "Description"
        viewModel.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
        viewModel.isDone = false
        
        // Then
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12)))
    }
    
    func testDetailTaskView_lowPriority() {
        // Given
        let viewModel = TaskViewModelMock()
        let view = DetailTaskView(viewModel: viewModel, state: .none, isPresented: .constant(true))
        
        // When
        viewModel.name = "Priority"
        viewModel.description = "Lorem ipsum dolor"
        viewModel.isDone = false
        viewModel.priority = .low
        
        // Then
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12)))
    }
    
    func testDetailTaskView_mediumPriority() {
        // Given
        let viewModel = TaskViewModelMock()
        let view = DetailTaskView(viewModel: viewModel, state: .none, isPresented: .constant(true))
        
        // When
        viewModel.name = "Priority"
        viewModel.description = "Lorem ipsum dolor"
        viewModel.isDone = false
        viewModel.priority = .medium
        
        // Then
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12)))
    }
    
    func testDetailTaskView_highPriority() {
        // Given
        let viewModel = TaskViewModelMock()
        let view = DetailTaskView(viewModel: viewModel, state: .none, isPresented: .constant(true))
        
        // When
        viewModel.name = "Priority"
        viewModel.description = "Lorem ipsum dolor"
        viewModel.isDone = false
        viewModel.priority = .high
        
        // Then
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12)))
    }
    
    func testDetailTaskView_criticalPriority() {
        // Given
        let viewModel = TaskViewModelMock()
        let view = DetailTaskView(viewModel: viewModel, state: .none, isPresented: .constant(true))
        
        // When
        viewModel.name = "Priority"
        viewModel.description = "Lorem ipsum dolor"
        viewModel.isDone = false
        viewModel.priority = .critical
        
        // Then
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12)))
    }
    
    // MARK: Detail.Edit
    func testDetailTaskView_edit_empty() {
        // Given
        let viewModel = TaskViewModelMock()
        let view = NavigationView { DetailTaskView(viewModel: viewModel, state: .edit, isPresented: .constant(true)) }
        
        // When
        viewModel.name = ""
        viewModel.description = ""
        viewModel.isDone = false
        viewModel.priority = .medium
        
        // Then
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12)))
    }
    
    func testDetailTaskView_edit_fill() {
        // Given
        let viewModel = TaskViewModelMock()
        let view = NavigationView { DetailTaskView(viewModel: viewModel, state: .edit, isPresented: .constant(true)) }
        
        // When
        viewModel.name = "Name"
        viewModel.description = "Description"
        viewModel.isDone = false
        viewModel.priority = .medium
        
        // Then
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12)))
    }
    
    // MARK: Detail.Edit
    func testDetailTaskView_addNew_empty() {
        // Given
        let viewModel = TaskViewModelMock()
        let view = NavigationView { DetailTaskView(viewModel: viewModel, state: .addNew, isPresented: .constant(true)) }
        
        // When
        viewModel.name = ""
        viewModel.description = ""
        viewModel.isDone = false
        viewModel.priority = .medium
        
        // Then
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12)))
    }
    
    func testDetailTaskView_addNew_fill() {
        // Given
        let viewModel = TaskViewModelMock()
        let view = NavigationView { DetailTaskView(viewModel: viewModel, state: .addNew, isPresented: .constant(true)) }
        
        // When
        viewModel.name = "Name"
        viewModel.description = "Description"
        viewModel.isDone = false
        viewModel.priority = .medium
        
        // Then
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12)))
    }
}
