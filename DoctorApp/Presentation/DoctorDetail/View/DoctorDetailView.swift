//
//  DoctorDetailView.swift
//  DoctorApp
//
//  Created by Vladyslav Mavrodimaki on 29/3/26.
//

import SwiftUI

struct DoctorDetailView: View {
    let doctor: Doctor
    @EnvironmentObject private var router: NavigationRouter
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 16) {
                NavigationTopBar(navigationTitle: doctor.displaySpecialization) {
                    router.popBack()
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    DoctorProfileHeader(
                        avatarURL: doctor.avatarURL,
                        fullName: doctor.fullName
                    )
                    
                    docAboutLine("appClockIcon", doctor.displaySeniority)
                    docAboutLine("appDocChemodanIcon", doctor.displayCategory)
                    docAboutLine("appStudyHeatIcon", doctor.displayEducation)
                    docAboutLine("appLocationIcon", doctor.displayWorkplace)
                }
                
                VStack(alignment: .leading, spacing: 24) {
                    Button {
                        router.navigate(to: .serviceDetails(doctor))
                    } label: {
                        HStack {
                            Text("Стоимость услуг")
                                .font(.system(size: 16, weight: .semibold))
                            Spacer()
                            Text(doctor.displayPrice)
                                .font(.system(size: 16, weight: .semibold))
                        }
                        .frame(maxWidth: .infinity, maxHeight: 60)
                        .padding(.horizontal)
                        .background(Color.white)
                        .foregroundStyle(.appBlack)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.primaryButtonGray, lineWidth: 1)
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
            
            Spacer()
            
            PrimaryButton(isActive: doctor.hasPrice, isLarge: true) {
                //
            }
        }
        .safeAreaPadding()
        .background(Color.appBackground)
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func docAboutLine(_ icon: String, _ text: String) -> some View {
        HStack(spacing: 12) {
            Image(icon)
            
            Text(text)
                .font(.system(size: 14, weight: .regular))
                .foregroundStyle(.appGray)
        }
    }
}
