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
    @State private var text: String = ""
    @State private var doctors: [Doctor] = []
    @State private var isLoading: Bool = true
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 0) {
            VStack(spacing: 15) {
                NavigationTopBar(navigationTitle: "Педиатры", dismissButtonIsHidden: true) {
                    //
                }
                .padding(.top, 16)
                
                SearchBarView(searchText: $text)
                    .padding(.horizontal)
                    .padding(.bottom, 10)
            }
            
            if isLoading {
                Spacer()
                ProgressView("Загрузка...")
                    .font(.system(size: 14))
                    .foregroundStyle(.appGray)
                Spacer()
            } else if doctors.isEmpty {
                Spacer()
                Text("Врачи не найдены")
                    .font(.system(size: 16))
                    .foregroundStyle(.appGray)
                Spacer()
            } else {
                List {
                    ForEach(doctors) { doctor in
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
            }
        }
        .ignoresSafeArea(.keyboard)
        .background(Color.appBackground)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .navigationBar)
        .onAppear {
            if doctors.isEmpty {
                loadDoctors()
            }
        }
    }
    
    // MARK: - Methods
    private func loadDoctors() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if let response = JSONLoader.loadFromBundle("doctors", as: DoctorResponse.self) {
                doctors = response.record.data.users
            }
            isLoading = false
        }
    }
}
