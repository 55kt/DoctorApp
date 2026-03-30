//
//  ServiceDetailsView.swift
//  DoctorApp
//
//  Created by Vladyslav Mavrodimaki on 30/3/26.
//

import SwiftUI

struct ServiceDetailsView: View {
    // MARK: - Properties
    let doctor: Doctor
    @EnvironmentObject private var router: NavigationRouter
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color.appBackground
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 26) {
                NavigationTopBar(navigationTitle: "Стоимость услуг") {
                    router.popBack()
                }
                
                VStack(spacing: 24) {
                    if doctor.videoChatPrice > 0 {
                        serviceBar(title: "Видеоконсультация", leadingText: "30 мин", trailingText: "\(doctor.videoChatPrice) ₽", bottomRounded: false)
                    }
                    if doctor.textChatPrice > 0 {
                        serviceBar(title: "Чат с врачом", leadingText: "30 мин", trailingText: "\(doctor.textChatPrice) ₽", bottomRounded: false)
                    }
                    if doctor.hospitalPrice > 0 {
                        serviceBar(title: "Приём в клинике", leadingText: "В клинике", trailingText: "\(doctor.hospitalPrice) ₽", bottomRounded: true)
                    }
                }
                
                Spacer()
            }
            .safeAreaPadding()
        }
        .toolbar(.hidden, for: .navigationBar)
    }
    
    // MARK: - Methods
    private func serviceBar(title: String, leadingText: String, trailingText: String, bottomRounded: Bool = true) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.system(size: 16, weight: .semibold))
            
            HStack {
                Text(leadingText)
                    .font(.system(size: 16, weight: .regular))
                
                Spacer()
                
                Text(trailingText)
                    .font(.system(size: 16, weight: .semibold))
            }
            .frame(maxWidth: .infinity, maxHeight: 60)
            .padding(.horizontal)
            .background(Color.white)
            .clipShape(
                UnevenRoundedRectangle(
                    topLeadingRadius: 8,
                    bottomLeadingRadius: bottomRounded ? 8 : 0,
                    bottomTrailingRadius: bottomRounded ? 8 : 0,
                    topTrailingRadius: 8
                )
            )
            .overlay {
                UnevenRoundedRectangle(
                    topLeadingRadius: 8,
                    bottomLeadingRadius: bottomRounded ? 8 : 0,
                    bottomTrailingRadius: bottomRounded ? 8 : 0,
                    topTrailingRadius: 8
                )
                .stroke(Color.primaryButtonGray, lineWidth: 1)
            }
        }
        .foregroundStyle(.appBlack)

    }
}
