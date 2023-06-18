//
//  ProductView.swift
//  Shopaholic
//
//  Created by Osaretin Uyigue on 6/18/23.
//

import SwiftUI

struct ProductView: View {
    var product: Product
    /// animation to detailsView
    var animation: Namespace.ID
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            
            ZStack {
                Color(product.image)
                    .cornerRadius(15)
                
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .padding(20)
                    .matchedGeometryEffect(id: product.image, in: animation)
            }
            Text(product.title)
                .fontWeight(.heavy)
                .foregroundColor(.gray)
            
            Text(product.price)
                .fontWeight(.heavy)
                .foregroundColor(.black)
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        ProductView(product: Product.placeholders.first!, animation: namespace)
    }
}
