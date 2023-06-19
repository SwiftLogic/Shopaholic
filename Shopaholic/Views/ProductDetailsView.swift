//
//  ProductDetailsView.swift
//  Shopaholic
//
//  Created by Osaretin Uyigue on 6/18/23.
//

import SwiftUI

struct ProductDetailsView: View {
    @Binding var product: Product?
    @Binding var showDetailsView: Bool
    var animation: Namespace.ID
    @State private var selectedColor = Color.clear
    private let isSmallDevice = UIScreen.main.bounds.height < 750
    
    var body: some View {
        if let product = product {
                VStack {
                    ProductDetailsNavBar(
                        title: product.title,
                        showDetailsView: $showDetailsView)
                    .padding()
                    
                    ProductDetailsHeaderView(product: product, animation: animation)
                        .padding()
                        .padding(.top, isSmallDevice ? -10 : 10)
                        .zIndex(1)
                    
                    ProductDetailsInfoPanView(product: product,
                                              selectedColor: $selectedColor)
                    .padding(.horizontal)
                    .padding(.top, -50)
                    .background {
                        Color.white
                            .cornerRadius(35, corners: [.topLeft, .topRight])
                            .padding(.top, -100)
                            .frame(height: UIScreen.main.bounds.height / 2.2)
                            .offset(y: 40)
                    }
                    .zIndex(0)
                    .opacity(showDetailsView ? 1 : 0)
                }
                .background {
                    selectedColor
                        .frame(height: UIScreen.main.bounds.height)
                        .ignoresSafeArea()
                        .opacity(showDetailsView ? 1 : 0)
                }
                .onAppear {
                    selectedColor = Color(product.image)
                }
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
        ProductDetailsView(product: .constant(Product.placeholders.first!), showDetailsView: .constant(true), animation: namespace)
    }
}
