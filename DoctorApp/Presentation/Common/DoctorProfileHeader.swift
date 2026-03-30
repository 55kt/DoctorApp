//
//  DoctorProfileHeader.swift
//  DoctorApp
//
//  Created by Vladyslav Mavrodimaki on 29/3/26.
//

import SwiftUI

struct DoctorProfileHeader: View {
    // MARK: - Properties
    var avatarURL: URL?
    var fullName: String
    var imageSize: CGFloat = 50
    
    @State private var isTimedOut = false
    @State private var isLoaded = false
    
    // MARK: - Body
    var body: some View {
        HStack(spacing: 16) {
            if let url = avatarURL, !isTimedOut {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .onAppear {
                                isLoaded = true
                            }
                    case .failure:
                        placeholderImage
                    case .empty:
                        ProgressView()
                            .tint(.appPink)
                    @unknown default:
                        placeholderImage
                    }
                }
                .frame(width: imageSize, height: imageSize)
                .clipShape(Circle())
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        if !isLoaded {
                            isTimedOut = true
                        }
                    }
                }
            } else {
                placeholderImage
                    .frame(width: imageSize, height: imageSize)
                    .clipShape(Circle())
            }
            
            Text(fullName)
                .font(.system(size: 16, weight: .semibold))
                .fixedSize(horizontal: false, vertical: true)
                .foregroundStyle(.appBlack)
        }
    }
    
    // MARK: - Views
    private var placeholderImage: some View {
        Image(systemName: "person.circle.fill")
            .resizable()
            .scaledToFill()
            .foregroundStyle(.appPink)
    }
}
