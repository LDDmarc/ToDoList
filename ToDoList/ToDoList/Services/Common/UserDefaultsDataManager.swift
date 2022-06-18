//
//  UserDefaultsDatamanager.swift
//  ToDoList
//
//  Created by Дарья Леонова on 17.06.2022.
//

import Foundation

final class UserDefaultsDataManager: DataManager {
    private let userDafaults = UserDefaults.standard
    
    func save<T: Codable>(model: T, key: DataKey) {
        let encoder = JSONEncoder()
        if let encodedModel = try? encoder.encode(model) {
            userDafaults.set(encodedModel, forKey: key.stringValue)
        }
    }
    
    func get<T: Codable>(type: T.Type, key: DataKey) -> T? {
        let decoder = JSONDecoder()
        guard
            let data = userDafaults.object(forKey: key.stringValue) as? Data,
            let model = try? decoder.decode(type, from: data)
        else {
            return nil
        }
        return model
    }
}
