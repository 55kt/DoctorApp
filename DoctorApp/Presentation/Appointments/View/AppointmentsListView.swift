//
//  AppointmentsListView.swift
//  DoctorApp
//
//  Created by Vladyslav Mavrodimaki on 27/3/26.
//

import SwiftUI

struct AppointmentsListView: View {    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color.appBackground
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Text("Appointments View")
                .font(.system(size: 50, weight: .bold))
                .foregroundStyle(.appBlack)
        }
        .ignoresSafeArea()
    }
}

// MARK: - Preview
#Preview {
    AppointmentsListView()
}
