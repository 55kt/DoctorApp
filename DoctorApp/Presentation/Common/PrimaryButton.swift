//
//  PrimaryButton.swift
//  DoctorApp
//
//  Created by Vladyslav Mavrodimaki on 27/3/26.
//

import SwiftUI

struct PrimaryButton: View {
    // MARK: - Properties
    var title: String?
    var isActive: Bool
    var action: () -> Void
    
    private var buttonTitle: String {
        title ?? (isActive ? "Записаться" : "Нет свободного расписания")
    }
    
    // MARK: - Body
    var body: some View {
        Button {
            action()
        } label: {
            Text(buttonTitle)
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(isActive ? .white : .appBlack)
                .frame(maxWidth: .infinity)
                .frame(height: 47)
                .background(isActive ? Color.appPink : Color.primaryButtonGray)
                .clipShape(RoundedRectangle(cornerRadius: 8))
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Preview
#Preview {
    PrimaryButton(isActive: false) {}
        .padding(.horizontal)
}
