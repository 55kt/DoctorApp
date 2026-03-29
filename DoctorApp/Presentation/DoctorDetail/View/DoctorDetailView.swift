//
//  DoctorDetailView.swift
//  DoctorApp
//
//  Created by Vladyslav Mavrodimaki on 29/3/26.
//

import SwiftUI

struct DoctorDetailView: View {
    // MARK: - Properties
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 16) {
                // Custom Tab bar
                HStack {
                    Button {
                        //
                    } label: {
                        Image("appChevronIcon")
                    }

                    
                    Spacer()
                    
                    Text("Педиатр")
                        .font(.system(size: 20, weight: .medium))
                    
                    Spacer()
                    
                    // This icon needed for centering title (Костыль)
                    Image("appChevronIcon")
                        .opacity(0)
                }
                
                // Doctor image & name
                VStack(alignment: .leading, spacing: 20) {
                    HStack(spacing: 16) {
                        Image("vz")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        
                        // Username
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Семенова")
                            Text("Дарья Сергеевна")
                        }
                        .font(.system(size: 16, weight: .semibold))
                        .lineHeight(.exact(points: 24))
                    }
                    
                    // Doctor Details (Expirience & other)
                    docAboutLine("appClockIcon", "Опыт работы: 27 лет")
                    docAboutLine("appDocChemodanIcon", "Врач высшей категории")
                    docAboutLine("appStudyHeatIcon", "1-й ММИ им. И.М.Сеченова")
                    docAboutLine("appLocationIcon", "Детская клиника “РебёнОК”  ")
                }
                
                // Price -> Price Details
                VStack(alignment: .leading, spacing: 24) {
                    Button {
                        //
                    } label: {
                        HStack {
                            Text("Стоимость услуг")
                                .font(.system(size: 16, weight: .semibold))
                            Spacer()
                            Text("от 600 ₽")
                                .font(.system(size: 16, weight: .semibold))
                        }
                        .frame(maxWidth: .infinity, maxHeight: 60)
                        .padding(.horizontal)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .overlay {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.primaryButtonGray, lineWidth: 1)
                        }
                    }
                    .buttonStyle(.plain)
                    
                    Text("Проводит диагностику и лечение терапевтических больных. Осуществляет расшифровку и снятие ЭКГ. Дает рекомендации по диетологии. Доктор имеет опыт работы в России и зарубежом. Проводит консультации пациентов на английском языке.")
                        .font(.system(size: 14, weight: .regular))
                        .lineHeight(.exact(points: 24))
                }
            }
            
            // About text
            // padding top 24
            
            Spacer()
            
            // Primary button
            PrimaryButton(isActive: false, isLarge: true) {
                //
            }
        }
        .safeAreaPadding()
        .background(Color.appBackground)
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

// MARK: - Preview
#Preview {
    NavigationStack {
        DoctorDetailView()
    }
}
