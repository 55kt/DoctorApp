//
//  MainTabBarView.swift
//  DoctorApp
//
//  Created by Vladyslav Mavrodimaki on 27/3/26.
//

import SwiftUI

struct MainTabBarView: View {
    // MARK: - Properties
    @Binding var selectedTab: TabItem
    @State private var chatBadgeCount: Int = 1
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(Color.gray.opacity(0.3))
                .frame(height: 1)
            
            HStack(alignment: .bottom, spacing: 36) {
                ForEach(TabItem.allCases, id: \.self) { tab in
                    Button {
                        withAnimation(.snappy(duration: 0.2)) {
                            selectedTab = tab
                        }
                    } label: {
                        VStack(alignment: .center, spacing: 5) {
                            Image(tab.icon)
                                .frame(width: 32, height: 32)
                                .foregroundStyle(selectedTab == tab ? .appPink : .appGray)
                                .overlay(alignment: .topTrailing) {
                                    if tab == .chat && chatBadgeCount > 0 {
                                        ZStack(alignment: .center) {
                                            Circle()
                                                .frame(width: 22)
                                                .foregroundStyle(Color.white)
                                            
                                            Text("\(chatBadgeCount)")
                                                .font(.system(size: 10))
                                                .foregroundStyle(.white)
                                                .frame(minWidth: 17, minHeight: 17)
                                                .background(Color.appPink)
                                                .clipShape(Circle())
                                        }
                                        .offset(x: 4, y: -4)
                                    }
                                }
                            
                            Text(tab.title)
                                .font(.system(size: 10))
                                .foregroundStyle(selectedTab == tab ? .appPink : .appGray)
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(.top, 17)
        }
        .background(Color.white)
    }
}

#Preview {
    MainTabBarView(selectedTab: .constant(.home))
}
