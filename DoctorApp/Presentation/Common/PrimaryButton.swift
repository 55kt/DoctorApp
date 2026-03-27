//
//  PrimaryButton.swift
//  DoctorApp
//
//  Created by Vladyslav Mavrodimaki on 27/3/26.
//

import SwiftUI

struct PrimaryButton: View {
    // MARK: - Properties
    var isActive: Bool
    var action: () -> Void
    
    // MARK: - Body
    var body: some View {
        Button {
            action()
        } label: {
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 47)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .foregroundStyle(isActive ? .appPink : .primaryButtonGray)
                .overlay(alignment: .center) {
                    Text(isActive ? "Записаться" : "Нет свободного расписания")
                        .font(.system(size: 16, weight: .semibold, design: .default))
                }
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Preview
#Preview {
    PrimaryButton(isActive: false) {}
        .padding(.horizontal)
}
