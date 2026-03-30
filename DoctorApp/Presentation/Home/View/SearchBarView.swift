//
//  SearchBarView.swift
//  DoctorApp
//
//  Created by Vladyslav Mavrodimaki on 29/3/26.
//

import SwiftUI

struct SearchBarView: View {
    // MARK: - Properties
    @Binding var searchText: String
    @State private var selectedSort: SortOption = .byPrice
    @State private var sortDirection: SortDirection = .ascending
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Search field
            HStack(spacing: 10) {
                Image("magnifyingglassAppIcon")
                
                TextField("Поиск", text: $searchText)
                
                Spacer()
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 9)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.primaryButtonGray, lineWidth: 1.0)
            )
            
            // Search sort buttons
            HStack(spacing: 0) {
                ForEach(SortOption.allCases, id: \.self) { option in
                    if option != SortOption.allCases.first {
                        Rectangle()
                            .fill(Color.primaryButtonGray)
                            .frame(width: 1)
                    }
                    
                    Button {
                        if selectedSort == option {
                            sortDirection.toggle()
                        } else {
                            selectedSort = option
                            sortDirection = .ascending
                        }
                    } label: {
                        HStack(spacing: 6) {
                            Text(option.title)
                                .font(.system(size: 14))
                                .foregroundStyle(selectedSort == option ? .white : .appGray)
                            
                            if selectedSort == option {
                                Image("appArrowIcon")
                                    .rotationEffect(.degrees(sortDirection == .ascending ? 0 : 180))
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(selectedSort == option ? Color.appPink : Color.clear)
                    }
                    .buttonStyle(.plain)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 32)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.primaryButtonGray, lineWidth: 1.0)
            }
        }
    }
}

// MARK: - Preview
#Preview {
    SearchBarView(searchText: .constant(""))
        .padding(.horizontal)
}
