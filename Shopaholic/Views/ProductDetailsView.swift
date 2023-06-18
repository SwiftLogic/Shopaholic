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

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(product: .constant(Product.placeholders.first!), show: .constant(true))
    }
}
