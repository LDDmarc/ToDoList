//
//  DataManagerMock.swift
//  ToDoListUnitTests
//
//  Created by Дарья Леонова on 26.06.2022.
//

import Foundation
@testable import ToDoList

final class DataManagerMock: DataManager {
    func save<T>(model: T, key: DataKey) where T : Decodable, T : Encodable { }
    func get<T>(type: T.Type, key: DataKey) -> T? where T : Decodable, T : Encodable {
        TaskModelsMockProvider.tasks as? T
    }
}
