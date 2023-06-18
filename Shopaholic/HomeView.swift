//
//  HomeView.swift
//  Shopaholic
//
//  Created by Osaretin Uyigue on 6/18/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            NavBar()
                .padding()
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
            
            Spacer()
        }
        .background(Color.black.opacity(0.05).ignoresSafeArea())
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
