//
//  NavigationRouter.swift
//  DoctorApp
//
//  Created by Vladyslav Mavrodimaki on 27/3/26.
//

import Foundation
import Combine
import SwiftUI

final class NavigationRouter: ObservableObject {
    @Published var homePath = NavigationPath()
    @Published var appointmentsPath = NavigationPath()
    @Published var chatPath = NavigationPath()
    @Published var profilePath = NavigationPath()
    @Published var selectedTab: TabItem = .home
    
    var currentPath: Binding<NavigationPath> {
        switch selectedTab {
        case .home: return Binding(get: { self.homePath }, set: { self.homePath = $0 })
        case .appointments: return Binding(get: { self.appointmentsPath }, set: { self.appointmentsPath = $0 })
        case .chat: return Binding(get: { self.chatPath }, set: { self.chatPath = $0 })
        case .profile: return Binding(get: { self.profilePath }, set: { self.profilePath = $0 })
        }
    }
    
    func navigate(to destination: Navigation) {
        switch selectedTab {
        case .home: homePath.append(destination)
        case .appointments: appointmentsPath.append(destination)
        case .chat: chatPath.append(destination)
        case .profile: profilePath.append(destination)
        }
    }
    
    func popBack() {
        switch selectedTab {
        case .home: homePath.removeLast()
        case .appointments: appointmentsPath.removeLast()
        case .chat: chatPath.removeLast()
        case .profile: profilePath.removeLast()
        }
    }
    
    func popToRoot() {
        switch selectedTab {
        case .home: homePath = NavigationPath()
        case .appointments: appointmentsPath = NavigationPath()
        case .chat: chatPath = NavigationPath()
        case .profile: profilePath = NavigationPath()
        }
    }
}
