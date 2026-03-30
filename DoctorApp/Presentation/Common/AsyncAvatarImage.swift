//
//  AsyncAvatarImage.swift
//  DoctorApp
//
//  Created by Vladyslav Mavrodimaki on 30/3/26.
//

import SwiftUI

struct AsyncAvatarImage: View {
    // MARK: - Properties
    let url: URL?
    var size: CGFloat = 50
    
    @State private var isTimedOut = false
    
    // MARK: - Body
    var body: some View {
        Group {
            if let url, !isTimedOut {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                    case .failure:
                        placeholder
                    case .empty:
                        ProgressView()
                            .tint(.appPink)
                    @unknown default:
                        placeholder
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        isTimedOut = true
                    }
                }
            } else {
                placeholder
            }
        }
        .frame(width: size, height: size)
        .clipShape(Circle())
    }
    
    // MARK: - Views
    private var placeholder: some View {
        Image(systemName: "person.circle.fill")
            .resizable()
            .scaledToFill()
            .foregroundStyle(.appGray)
    }
}
