//
//  TaskCellSnapshotTests.swift
//  ToDoListSnapshotTests
//
//  Created by Дарья Леонова on 25.06.2022.
//

import XCTest
import SnapshotTesting
@testable import ToDoList

class TaskCellSnapshotTests: SnapshotTestCase {
    func testTaskCell_notDone() {
        // Given
        let viewModel = TaskViewModelMock()
        let view = TaskCell(task: .constant(viewModel))
        
        // When
        viewModel.name = "Status"
        viewModel.description = "Lorem ipsum dolor"
        viewModel.isDone = false
        viewModel.priority = .critical
        
        // Then
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12)))
    }
    
    func testTaskCell_done() {
        // Given
        let viewModel = TaskViewModelMock()
        let view = TaskCell(task: .constant(viewModel))
        
        // When
        viewModel.name = "Status"
        viewModel.description = "Lorem ipsum dolor"
        viewModel.isDone = true
        viewModel.priority = .critical
        
        // Then
        assertSnapshot(matching: view, as: .image(layout: .device(config: .iPhone12)))
    }
}
