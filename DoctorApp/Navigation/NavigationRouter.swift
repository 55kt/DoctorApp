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
    @Published var paths: [TabItem: NavigationPath] = [
        .home: NavigationPath(),
        .appointments: NavigationPath(),
        .chat: NavigationPath(),
        .profile: NavigationPath()
    ]
    @Published var selectedTab: TabItem = .home
    
    func navigate(to destination: Navigation) {
        paths[selectedTab]?.append(destination)
    }
    
    func popBack() {
        guard let path = paths[selectedTab], !path.isEmpty else { return }
        paths[selectedTab]?.removeLast()
    }
    
    func popToRoot() {
        paths[selectedTab] = NavigationPath()
    }
    
    func binding(for tab: TabItem) -> Binding<NavigationPath> {
        Binding(
            get: { self.paths[tab] ?? NavigationPath() },
            set: { self.paths[tab] = $0 }
        )
    }
}
