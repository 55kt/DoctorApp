//
//  NavigationTopBar.swift
//  DoctorApp
//
//  Created by Vladyslav Mavrodimaki on 30/3/26.
//

import SwiftUI

struct NavigationTopBar: View {
    // MARK: - Properties
    var navigationTitle: String
    var dismissButtonIsHidden: Bool = false
    var dismissAction: () -> Void
    
    // MARK: - Body
    var body: some View {
        HStack {
            if !dismissButtonIsHidden {
                Button {
                    dismissAction()
                } label: {
                    Image("appChevronIcon")
                }
            }

            
            Spacer()
            
            Text(navigationTitle)
                .font(.system(size: 20, weight: .medium))
                .foregroundStyle(.appBlack)
            
            Spacer()
            
            // This icon needed for centering title (Костыль)
            Image("appChevronIcon")
                .opacity(0)
        }
    }
}

// MARK: - Preview
#Preview {
    NavigationTopBar(navigationTitle: "Title") {}
}
