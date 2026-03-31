//
//  HomeViewModel.swift
//  DoctorApp
//
//  Created by Vladyslav Mavrodimaki on 27/3/26.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    // MARK: - Published Properties
    @Published var searchText: String = ""
    @Published var selectedSort: SortOption = .byPrice
    @Published var sortDirection: SortDirection = .ascending
    @Published var isLoading: Bool = true
    
    @Published private(set) var filteredDoctors: [Doctor] = []
    private var allDoctors: [Doctor] = []
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Init
    init() {
        setupSearch()
    }
    
    // MARK: - Methods
    func loadDoctors() {
        isLoading = true
        // Это я добавил что бы срабатывал индикатор загрузки. Ну типо имитация БД
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            guard let self else { return }
            if let response = JSONLoader.loadFromBundle("doctors", as: DoctorResponse.self) {
                self.allDoctors = response.record.data.users
                self.applyFilterAndSort()
            }
            self.isLoading = false
        }
    }
    
    func toggleSort(for option: SortOption) {
        if selectedSort == option {
            sortDirection.toggle()
        } else {
            selectedSort = option
            sortDirection = .ascending
        }
        applyFilterAndSort()
    }
    
    // MARK: - Private Methods
    private func setupSearch() {
        $searchText
            .debounce(for: .milliseconds(300), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] _ in
                self?.applyFilterAndSort()
            }
            .store(in: &cancellables)
    }
    
    private func applyFilterAndSort() {
        var result = allDoctors
        
        // Filter
        if !searchText.isEmpty {
            let query = searchText.lowercased()
            result = result.filter { doctor in
                doctor.lastName.lowercased().contains(query) ||
                doctor.firstName.lowercased().contains(query) ||
                doctor.patronymic.lowercased().contains(query) ||
                doctor.displaySpecialization.lowercased().contains(query)
            }
        }
        
        // Sort
        result.sort { lhs, rhs in
            let ascending: Bool
            switch selectedSort {
            case .byPrice:
                ascending = lhs.minPrice < rhs.minPrice
            case .byExperience:
                ascending = lhs.seniority < rhs.seniority
            case .byRating:
                ascending = lhs.ratingsRating < rhs.ratingsRating
            }
            return sortDirection == .ascending ? ascending : !ascending
        }
        
        filteredDoctors = result
    }
}
