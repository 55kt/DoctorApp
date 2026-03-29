//
//  SortOption.swift
//  DoctorApp
//
//  Created by Vladyslav Mavrodimaki on 29/3/26.
//

import Foundation

enum SortOption: CaseIterable {
    case byPrice
    case byExperience
    case byRating
    
    var title: String {
        switch self {
        case .byPrice: return "По цене"
        case .byExperience: return "По стажу"
        case .byRating: return "По рейтингу"
        }
    }
}
