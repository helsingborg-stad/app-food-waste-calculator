//
//  NavigationTests.swift
//  FoodWasteTests
//
//  Created by Jonatan Hanson on 2022-03-22.
//

import XCTest
@testable import FoodWaste

class NavigationTests: XCTestCase {
    var navigation: Navigation!

    override func setUpWithError() throws {
        navigation = Navigation()
    }

    override func tearDownWithError() throws {
        navigation = nil
    }

    func testNextStep() {
        navigation.step = 1
        navigation.next()
        XCTAssertEqual(navigation.step, 2)
    }
    
    func testPreviousStep() {
        navigation.step = 2
        navigation.previous()
        XCTAssertEqual(navigation.step, 1)
    }
    
    func testResetStep() {
        navigation.step = 10
        navigation.reset()
        XCTAssertEqual(navigation.step, 0)
    }    
}
