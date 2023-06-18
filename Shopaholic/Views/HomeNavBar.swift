//
//  HomeNavBar.swift
//  Shopaholic
//
//  Created by Osaretin Uyigue on 6/18/23.
//

import SwiftUI

struct HomeNavBar: View {
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

struct HomeNavBar_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HomeNavBar()
                .padding()
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
            Spacer()
        }
        
    }
}
