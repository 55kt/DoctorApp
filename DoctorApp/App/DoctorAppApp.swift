//
//  DoctorAppApp.swift
//  DoctorApp
//
//  Created by Vladyslav Mavrodimaki on 27/3/26.
//

import SwiftUI

@main
struct DoctorAppApp: App {
    @StateObject private var router = NavigationRouter()
    
    var body: some Scene {
        WindowGroup {
            VStack(spacing: 0) {
                ZStack {
                    tabView(for: .home) { HomeView() }
                    tabView(for: .appointments) { AppointmentsListView() }
                    tabView(for: .chat) { ChatView() }
                    tabView(for: .profile) { ProfileView() }
                }
                
                MainTabBarView(selectedTab: $router.selectedTab)
            }
            .ignoresSafeArea(.keyboard)
            .environmentObject(router)
        }
    }
    
    @ViewBuilder
    private func tabView<Content: View>(for tab: TabItem, @ViewBuilder content: () -> Content) -> some View {
        NavigationStack(path: router.binding(for: tab)) {
            content()
                .navigationDestination(for: Navigation.self) { destination in
                    switch destination {
                    case .doctorDetail(let doctor):
                        DoctorDetailView(doctor: doctor)
                    case .serviceDetails(let doctor):
                        ServiceDetailsView(doctor: doctor)
                    }
                }
        }
        .opacity(router.selectedTab == tab ? 1 : 0)
    }
}
