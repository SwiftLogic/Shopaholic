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
    @State private var selectedColor = Color.clear
    
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
                    .zIndex(1)
                
                ProductAppearancePanView(product: product,
                                         selectedColor: $selectedColor)
                    .padding()
                    .padding(.top, -20)
                    .background {
                        Color.white.padding(.top, -100)
                    }
                    .zIndex(0)
            }
            .background(Color(product.image))
            .background(Color.white)
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

private struct ProductAppearancePanView: View {
    let product: Product
    @Binding var selectedColor: Color
    
    var body: some View {
        VStack {
            HStack {
                productColorPickerView
                Spacer()
                productSizeTextView
            }
            Spacer()
        }
    }
    
    
    private var productColorPickerView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Color")
                .foregroundColor(.gray)
            
            HStack(spacing: 15) {
                // ColorPicker
                ColorPickerButton(color: Color(product.image),
                                  selectedColor: $selectedColor)
                ColorPickerButton(color: .yellow,
                                  selectedColor: $selectedColor)
                ColorPickerButton(color: .green,
                                  selectedColor: $selectedColor)
            }
        }
    }
    
    private var productSizeTextView: some View {
        VStack {
            Text("Size")
                .fontWeight(.semibold)
                .foregroundColor(.black)
            
            Text("12 cm")
                .fontWeight(.heavy)
                .foregroundColor(.black)
        }
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    @Namespace static var namespace

    static var previews: some View {
        ProductDetailsView(product: .constant(Product.placeholders.first!), show: .constant(true), animation: namespace)
    }
}
