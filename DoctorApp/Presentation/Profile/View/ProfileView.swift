//
//  ProfileView.swift
//  DoctorApp
//
//  Created by Vladyslav Mavrodimaki on 27/3/26.
//

import SwiftUI

struct ProfileView: View {
    // MARK: - Body
    var body: some View {
        ZStack {
            Color.appBackground
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Text("Profile View")
                .font(.system(size: 50, weight: .bold))
                .foregroundStyle(.appBlack)
        }
        .ignoresSafeArea()
    }
}

// MARK: - Preview
#Preview {
    ProfileView()
}
