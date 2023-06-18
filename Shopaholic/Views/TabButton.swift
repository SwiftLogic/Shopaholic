//
//  TabButton.swift
//  Shopaholic
//
//  Created by Osaretin Uyigue on 6/18/23.
//

import SwiftUI

struct TabButton: View {
    
    let tabItem: SwipeMenu
    @Binding var selectedTab: SwipeMenu
    var animation: Namespace.ID

    var body: some View {
        Button {
            withAnimation(.spring()) {selectedTab = tabItem}
        } label: {
            VStack(spacing: 6) {
                Text(tabItem.description)
                    .fontWeight(.heavy)
                    .foregroundColor(tabItem == selectedTab ? .black : .gray)
                
                if tabItem == selectedTab {
                    Capsule()
                        .fill(Color.black)
                        .frame(width: 40, height: 4)
                        .matchedGeometryEffect(id: "TAB", in:  animation)
                }
            }
        }
    }
}

struct TabButton_Previews: PreviewProvider {
    @Namespace static var namespace

    static var previews: some View {
        TabButton(tabItem: .handBag, selectedTab: .constant(.handBag), animation: namespace)
    }
}
