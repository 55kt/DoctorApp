//
//  DoctorCardView.swift
//  DoctorApp
//
//  Created by Vladyslav Mavrodimaki on 27/3/26.
//

import SwiftUI

struct DoctorCardView: View {
    // MARK: - Properties
    @State private var heartIsFilled: Bool = false
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .top, spacing: 16) {
                
                // User Image
                Image("vz")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 8) {
                    // Username
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Семенова")
                        Text("Дарья Сергеевна")
                    }
                    .font(.system(size: 16, weight: .semibold))
                    
                    // Raiting
                    HStack(spacing: 2.4) {
                        ForEach(0..<5, id: \.self) { _ in
                            Image("appStarIcon")
                        }
                    }
                    
                    // Doctor price
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Педиатр・стаж 27 лет")
                            .font(.system(size: 14))
                            .foregroundStyle(.appGray)
                        
                        Text("от 600 ₽")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundStyle(.appBlack)
                    }
                }
                
                Spacer()
                
                // Favorite button
                Button {
                    heartIsFilled.toggle()
                } label: {
                    Image("appHearthIcon")
                        .foregroundStyle(heartIsFilled ? .appPink : .appSilver)
                }
            }
            .padding(.bottom, 15)
            
            // Appointment Button
            PrimaryButton(isActive: true) {
                // Action
            }
        }
        .padding(.top, 20)
        .padding(.horizontal)
        .padding(.bottom)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.primaryButtonGray, lineWidth: 1.2)
        )
    }
}

// MARK: - Preview
#Preview {
    DoctorCardView()
        .padding()
}
