//
//  TabItem.swift
//  DoctorApp
//
//  Created by Vladyslav Mavrodimaki on 27/3/26.
//

import Foundation

enum TabItem: CaseIterable, Hashable {
    case home
    case appointments
    case chat
    case profile
    
    var title: String {
        switch self {
        case .home:
            return "Главная"
        case .appointments:
            return "Приёмы"
        case .chat:
            return "Чат"
        case .profile:
            return "Профиль"
        }
    }
    
    var icon: String {
        switch self {
        case .home:
            return "homeTabIcon"
        case .appointments:
            return "appointmentsTabIcon"
        case .chat:
            return "chatTabIcon"
        case .profile:
            return "profileTabIcon"
        }
    }
}
