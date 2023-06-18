//
//  NavItemButton.swift
//  Shopaholic
//
//  Created by Osaretin Uyigue on 6/18/23.
//

import SwiftUI


struct NavItemButton: View {
    var systemName: String
    var color: Color
    var action: (() -> Void)?
    
    init(systemName: String, color: Color = .black, action: (() -> Void)? = nil) {
        self.systemName = systemName
        self.color = color
        self.action = action
    }
    
    var body: some View {
        Button {
            action?()
        } label: {
            Image(systemName: systemName)
                .font(.title)
                .foregroundColor(color)
        }
        
    }
}

struct NavItemButton_Previews: PreviewProvider {
    static var previews: some View {
        NavItemButton(systemName: "cart")
    }
}
