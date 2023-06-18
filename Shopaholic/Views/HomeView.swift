//
//  HomeView.swift
//  Shopaholic
//
//  Created by Osaretin Uyigue on 6/18/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 0) {
            NavBar()
                .padding()
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
            
            ScrollView {
                VStack {
                    SectionTitle()
                        .padding()
                    SwipeMenuView()
                    
                }
            }
        }
        .background(Color.black.opacity(0.05).ignoresSafeArea())
    }
}

private struct SectionTitle: View {
    var body: some View {
        HStack {
            Text("Women")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.black)
            Spacer()
        }
    }
}

private struct SwipeMenuView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(SwipeMenu.allCases, id: \.self) { tab in
                    Text(tab.description)
                }
            }
        }
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
