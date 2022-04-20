//
//  LocalizationTests.swift
//  FoodWasteTests
//
//  Created by Jonatan Hanson on 2022-04-19.
//

@testable import FoodWaste
import XCTest

class LocalizationTests: XCTestCase {
    var localization: Localization!

    override func setUpWithError() throws {
        localization = Localization()
    }

    override func tearDownWithError() throws {
        localization = nil
    }

    func testSetLang() {
        localization.setLanguage(lang: .en)
        XCTAssertEqual(localization.language, .en)
    }

    func testGetFlag() {
        localization.language = .sv
        XCTAssertEqual(localization.language.flag, "🇸🇪")
    }

    func testStringTranslation() {
        let translatableString = "calcDisplayComputing"
        XCTAssertEqual(translatableString.localized(.sv), "Beräknar")
        XCTAssertEqual(translatableString.localized(.en), "Calculates")
    }
}
