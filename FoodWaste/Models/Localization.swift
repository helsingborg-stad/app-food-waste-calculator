//
//  Language.swift
//  FoodWaste
//
//  Created by Jonatan Hanson on 2022-04-06.
//

import Foundation

class Localization: ObservableObject {
    @Published var language: Language = .sv

    func setLanguage(lang: Language) {
        language = lang
    }
}

enum Language: String, Identifiable, CaseIterable {
    var id: Self { self }
    case sv, en
    var flag: String {
        switch self {
        case .sv: return "🇸🇪"
        case .en: return "🇬🇧"
        }
    }
}

extension String {
    func localized(_ lang: Language) -> String {
        let path = Bundle.main.path(forResource: lang.rawValue, ofType: "lproj")
        let bundle = Bundle(path: path!)

        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}
