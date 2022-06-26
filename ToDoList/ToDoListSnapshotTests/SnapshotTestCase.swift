//
//  SnapshotTestCase.swift
//  ToDoListTests
//
//  Created by Дарья Леонова on 25.06.2022.
//

import XCTest

class SnapshotTestCase: XCTestCase {
    private static let requiredDevice = "iPhone13,2"
    private static let requiredOSVersion = 15
    
    override class func setUp() {
        super.setUp()
        
        let deviceModel = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"]
        let osVersion = ProcessInfo().operatingSystemVersion
        
        guard deviceModel?.contains(requiredDevice) ?? false else {
            fatalError("Switch device to iPhone 12")
        }
        
        guard osVersion.majorVersion == requiredOSVersion else {
            fatalError("Switch to iOS \(requiredOSVersion)")
        }
    }
}
