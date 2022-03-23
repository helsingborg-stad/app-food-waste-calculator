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
        // Put setup code here. This method is called before the invocation of each test method in the class.
        navigation = Navigation()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
