//
//  GameTests.swift
//  FoodWasteTests
//
//  Created by Ehsan Zilaei on 2022-04-19.
//

import XCTest
@testable import FoodWaste

class GameTests: XCTestCase {
    var game: Game!
    
    override func setUpWithError() throws {
        game = Game()
    }

    override func tearDownWithError() throws {
        game = nil
    }

    func testHandleWasteButton() {
        game.handleWasteButton(waste: .sun)
        XCTAssertEqual(game.wasteInputs.count, 1)
        
        game.handleWasteButton(waste: .queueLong)
        XCTAssertEqual(game.wasteInputs.count, 2)
    }
    
    func testRemoveAllWasteInputs() {
        game.handleWasteButton(waste: .sun)
        XCTAssertEqual(game.wasteInputs.count, 1)
        
        game.removeAllWasteInputs()
        XCTAssertEqual(game.wasteInputs.count, 0)
    }
    
    func testSumWasteScore() {
        game.handleWasteButton(waste: .sun)
        XCTAssertEqual(game.sumWasteScore(), 3)
    }
    
    func testGetScoreLevelLow() {
        for i in 0...8 {
            XCTAssertEqual(game.getScoreLevel(score: i), .low)
        }
    }
    
    func testGetScoreLevelHigh() {
        for i in 9...12 {
            XCTAssertEqual(game.getScoreLevel(score: i), .high)
        }
    }
}
