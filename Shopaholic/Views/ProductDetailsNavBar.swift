//
//  ProductDetailsNavBar.swift
//  Shopaholic
//
//  Created by Osaretin Uyigue on 6/18/23.
//

import SwiftUI

struct ProductDetailsNavBar: View {
    let title: String
    @Binding var showDetailsView: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                NavItemButton(systemName: "chevron.left", color: .white) {
                    //ksoft
//                    withAnimation(.easeOut) {showDetailsView.toggle()}
                    withAnimation(.interactiveSpring(response: 0.3, dampingFraction: 1, blendDuration: 1)) {
                        showDetailsView.toggle()
                    }
                }
                Spacer()
                NavItemButton(systemName: "cart", color: .white)
            }
            
            navBarTitle
                .padding(.top)
        }
    }
    
    private var navBarTitle: some View {
        VStack {
            Text("Aristocratic Hand Bag")
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Text(title)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.white)
        }
    }
}


struct ProductDetailsNavBar_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ProductDetailsNavBar(title: "Office Bag", showDetailsView: .constant(true))
                .padding()
                .background(Color.theme.bag1)
            Spacer()
        }
    }
}
