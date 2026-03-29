//
//  HomeView.swift
//  DoctorApp
//
//  Created by Vladyslav Mavrodimaki on 27/3/26.
//

import SwiftUI

struct HomeView: View {
    // MARK: - Properties
    @State private var text: String = ""
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 0) {
            // Search
            SearchBarView(searchText: $text)
                .padding(.horizontal)
                .padding(.bottom, 10)
            
            // List of doctors
            List {
                ForEach(0...8, id: \.self) { card in
                    DoctorCardView()
                }
                .listRowSeparator(.hidden)
                .listRowBackground(Color.appBackground)
                .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .background(Color.appBackground)
            
            // Tab Bar
            MainTabBarView()
        }
        .ignoresSafeArea(.keyboard)
        .background(Color.appBackground)
        .navigationTitle("Педиатры")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Preview
#Preview {
    NavigationView {
        HomeView()
    }
}
