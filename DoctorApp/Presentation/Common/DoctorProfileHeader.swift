//
//  DoctorProfileHeader.swift
//  DoctorApp
//
//  Created by Vladyslav Mavrodimaki on 29/3/26.
//

import SwiftUI

struct DoctorProfileHeader: View {
    // MARK: - Properties
    var doctorPhoto: String
    var firstName: String
    var patronymic: String
    var lastName: String
    
    // MARK: - Body
    var body: some View {
        HStack(spacing: 16) {
            Image(doctorPhoto)
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            // Username
            VStack(alignment: .leading, spacing: 0) {
                Text("\(lastName)\n\(firstName) \(patronymic)")
                    .fixedSize(horizontal: false, vertical: true)
            }
            .font(.system(size: 16, weight: .semibold))
            .lineHeight(.exact(points: 24))
        }
    }
}

// MARK: - Preview
#Preview {
    DoctorProfileHeader(doctorPhoto: "vz", firstName: "Владимир", patronymic: "Вольфович", lastName: "Жириновский")
}
