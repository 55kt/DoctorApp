//
//  HomeView.swift
//  DoctorApp
//
//  Created by Vladyslav Mavrodimaki on 27/3/26.
//

import SwiftUI

struct HomeView: View {
    // MARK: - Properties
    @EnvironmentObject private var router: NavigationRouter
    @StateObject private var viewModel = HomeViewModel()
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 15) {
                NavigationTopBar(navigationTitle: "Педиатры", dismissButtonIsHidden: true) {
                    //
                }
                .padding(.top, 16)
                
                SearchBarView(
                    searchText: $viewModel.searchText,
                    selectedSort: viewModel.selectedSort,
                    sortDirection: viewModel.sortDirection,
                    onSortTap: { option in
                        withAnimation(.easeInOut(duration: 0.2)) {
                            viewModel.toggleSort(for: option)
                        }
                    }
                )
                .padding(.horizontal)
                .padding(.bottom, 10)
            }
            
            if viewModel.isLoading {
                Spacer()
                ProgressView("Загрузка...")
                    .font(.system(size: 14))
                    .foregroundStyle(.appGray)
                Spacer()
            } else if viewModel.filteredDoctors.isEmpty {
                Spacer()
                Text("Врачи не найдены")
                    .font(.system(size: 16))
                    .foregroundStyle(.appGray)
                Spacer()
            } else {
                List {
                    ForEach(viewModel.filteredDoctors) { doctor in
                        DoctorCardView(doctor: doctor) {
                            router.navigate(to: .doctorDetail(doctor))
                        }
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.appBackground)
                    .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .background(Color.appBackground)
                .animation(.easeInOut(duration: 0.3), value: viewModel.filteredDoctors)
            }
        }
        .ignoresSafeArea(.keyboard)
        .background(Color.appBackground)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .navigationBar)
        .onAppear {
            if viewModel.filteredDoctors.isEmpty {
                viewModel.loadDoctors()
            }
        }
    }
}
