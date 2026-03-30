//
//  DoctorCardView.swift
//  DoctorApp
//
//  Created by Vladyslav Mavrodimaki on 27/3/26.
//

import SwiftUI

struct DoctorCardView: View {
    // MARK: - Properties
    let doctor: Doctor
    var onTap: () -> Void
    @State private var heartIsFilled: Bool = false
    
    // MARK: - Body
    var body: some View {
        Button {
            onTap()
        } label: {
            VStack(alignment: .leading, spacing: 0) {
                HStack(alignment: .top, spacing: 16) {
                    
                    // Doctor image & name
                    DoctorProfileHeader(
                        avatarURL: doctor.avatarURL,
                        fullName: doctor.fullName
                    )
                    
                    Spacer()
                }
                
                // Rating, specialization & price — с отступом под фото
                VStack(alignment: .leading, spacing: 8) {
                    // Rating
                    HStack(spacing: 2.4) {
                        ForEach(0..<5, id: \.self) { index in
                            Image("appStarIcon")
                                .foregroundStyle(index < doctor.starCount ? .appPink : .appGray)
                        }
                    }
                    
                    // Specialization & price
                    Text(doctor.displayExperienceShort)
                        .font(.system(size: 14))
                        .foregroundStyle(.appGray)
                    
                    Text(doctor.displayPrice)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.appBlack)
                }
                .padding(.leading, 66)
                .padding(.bottom, 15)
                
                // Appointment button
                PrimaryButton(isActive: doctor.hasPrice) {
                    //
                }
            }
        }
        .buttonStyle(.plain)
        .overlay(alignment: .topTrailing) {
            Button {
                heartIsFilled.toggle()
            } label: {
                Image("appHearthIcon")
                    .foregroundStyle(heartIsFilled ? .appPink : .appSilver)
                    .padding(12)
            }
        }
        .padding(.top, 20)
        .padding(.horizontal)
        .padding(.bottom)
        .background(Color.white)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.primaryButtonGray, lineWidth: 1)
        )
    }
}
