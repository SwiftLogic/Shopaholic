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

    var body: some View {
        Button {
            withAnimation {selectedTab = tabItem}
        } label: {
            VStack(alignment: .leading, spacing: 6) {
                Text(tabItem.description)
                    .fontWeight(.heavy)
                    .foregroundColor(tabItem == selectedTab ? .black : .gray)
                
                Capsule()
                    .fill(Color.black)
                    .frame(width: 40, height: 4)
            }
        }
    }
}

struct TabButton_Previews: PreviewProvider {
    static var previews: some View {
        TabButton(tabItem: .handBag, selectedTab: .constant(.handBag))
    }
}
