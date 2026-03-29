//
//  SortDirection.swift
//  DoctorApp
//
//  Created by Vladyslav Mavrodimaki on 29/3/26.
//

import Foundation

enum SortDirection {
    case ascending
    case descending
    
    mutating func toggle() {
        self = (self == .ascending) ? .descending : .ascending
    }
}
