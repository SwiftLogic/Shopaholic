//
//  ProductDetailsView.swift
//  Shopaholic
//
//  Created by Osaretin Uyigue on 6/18/23.
//

import SwiftUI

struct ProductDetailsView: View {
    @Binding var product: Product
    @Binding var show: Bool

    var body: some View {
        // NavBar
        VStack {
            ProductDetailsNavBar(title: product.title,
                                 show: $show)
                .padding()
            Spacer()
        }
        .background(Color(product.image))
    
    }
}

private struct ProductDetailsNavBar: View {
    let title: String
    @Binding var show: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                NavItemButton(systemName: "chevron.left", color: .white) {
                    withAnimation(.easeOut) {show.toggle()}
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


struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(product: .constant(Product.placeholders.first!), show: .constant(true))
    }
}
