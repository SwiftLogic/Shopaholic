//
//  NavBar.swift
//  Shopaholic
//
//  Created by Osaretin Uyigue on 6/18/23.
//

import SwiftUI

struct NavBar: View {
    var body: some View {
        HStack {
            NavItemButton(systemName: "line.horizontal.3.decrease")
            Spacer()
            NavItemButton(systemName: "magnifyingglass")
            NavItemButton(systemName: "cart")
                .overlay(alignment: .topTrailing) {
                    cartRedDot
                        .offset(x: 5, y: -5)
                }
        }
        .overlay(navTitle)
    }
    
    
    private var cartRedDot: some View {
        Circle()
            .fill(.red)
            .frame(width: 15, height: 15)
    }
    
    private var navTitle: some View {
        Text("Shop")
            .font(.title)
            .fontWeight(.heavy)
            .foregroundColor(.black)
    }
    
}


private struct NavItemButton: View {
    var systemName: String
    var action: (() -> Void)?
    
    init(systemName: String, action: (() -> Void)? = nil) {
        self.systemName = systemName
        self.action = action
    }
    
    var body: some View {
        Button {
            action?()
        } label: {
            Image(systemName: systemName)
                .font(.title)
                .foregroundColor(.black)
        }
        
    }
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            NavBar()
                .padding()
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
            Spacer()
        }
        
    }
}
