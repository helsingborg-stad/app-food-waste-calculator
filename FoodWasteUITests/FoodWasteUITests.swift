//
//  FoodWasteUITests.swift
//  FoodWasteUITests
//
//  Created by Jonatan Hanson on 2022-03-15.
//

import XCTest

class FoodWasteUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testHighScoreResult() throws {
        let calcDisplayResultHigh = app.staticTexts["Det ser ut att bli rätt mycket matsvinn!"]
        let calculationResponseHigh = app.staticTexts["Ojdå! En sån här dag får vi tänka till!"]

        let forwardButton = app.buttons["forward"]
        forwardButton.tap()
        forwardButton.tap()
        forwardButton.tap()
        sleep(3)
        app.buttons["startButton"].tap()
        app.buttons["burger"].tap()
        app.buttons["soundHigh"].tap()
        app.buttons["queueLong"].tap()
        app.buttons["sun"].tap()
        app.buttons["equal"].tap()
        sleep(8)
        XCTAssertTrue(calcDisplayResultHigh.exists)
        XCTAssertTrue(calculationResponseHigh.exists)
        forwardButton.tap()
    }

    func testLowScoreResult() throws {
        let calcDisplayResultLow = app.staticTexts["Det verkar bli väldigt lite matsvinn!"]
        let calculationResponseLow = app.staticTexts["Toppen, vi vill ju ha så lite svinn som möjligt!"]

        let forwardButton = app.buttons["forward"]
        forwardButton.tap()
        forwardButton.tap()
        forwardButton.tap()
        sleep(3)
        app.buttons["startButton"].tap()
        app.buttons["gazpacho"].tap()
        app.buttons["soundLow"].tap()
        app.buttons["queueShort"].tap()
        app.buttons["rain"].tap()
        app.buttons["equal"].tap()
        sleep(8)
        XCTAssertTrue(calcDisplayResultLow.exists)
        XCTAssertTrue(calculationResponseLow.exists)
        forwardButton.tap()
    }
}
