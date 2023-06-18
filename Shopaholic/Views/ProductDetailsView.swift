//
//  ProductDetailsView.swift
//  Shopaholic
//
//  Created by Osaretin Uyigue on 6/18/23.
//

import SwiftUI

struct ProductDetailsView: View {
    @Binding var product: Product?
    @Binding var show: Bool
    var animation: Namespace.ID
    
    var body: some View {
        if let product = product {
            VStack {
                ProductDetailsNavBar(
                    title: product.title,
                    show: $show)
                .padding()
                
                ProductDetailsHeaderView(product: product, animation: animation)
                    .padding()
                    .padding(.top, 10)
                
                Spacer()
            }
            .background(Color(product.image))
            .background(Color.white)
        }        
    }
}

private struct ProductDetailsHeaderView: View {
    let product: Product
    var animation: Namespace.ID
    
    var body: some View {
        HStack(spacing: 10) {
            productPriceTextView()
            productImageView()
        }
    }
    
    private func productPriceTextView() -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Price")
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Text(product.price)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.white)
        }
    }
    
    @ViewBuilder
    private func productImageView() -> some View {
        Image(product.image)
            .resizable()
            .scaledToFit()
            .matchedGeometryEffect(id: product.image, in: animation)
    }
}


struct ProductDetailsView_Previews: PreviewProvider {
    @Namespace static var namespace

    static var previews: some View {
        ProductDetailsView(product: .constant(Product.placeholders.first!), show: .constant(true), animation: namespace)
    }
}
