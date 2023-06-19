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
                
                ProductDetailsInfoPanView(product: product,
                                         selectedColor: $selectedColor)
                .padding(.horizontal)
                .padding(.top, -20)
                .background {
                    Color.white
                        .cornerRadius(35, corners: [.topLeft, .topRight])
                        .padding(.top, -100)
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

private struct ProductDetailsInfoPanView: View {
    let product: Product
    @Binding var selectedColor: Color
    @State private var count = 1
    
    var body: some View {
        VStack {
            HStack {
                productColorPickerView
                Spacer()
                productSizeTextView
            }
            productDescriptionTextView
            productCartCount
            Spacer()
        }
    }
    
    
    private var productColorPickerView: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Color")
                .fontWeight(.bold)
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
    
    
    private var productDescriptionTextView: some View {
        Text("Whether you are heading to work or travelling, a trendy handbag or clutch will add as the perfect accessory with your outfit. Carry your daily essentials in style as you have a choice of shopping for bags.")
            .foregroundColor(.gray)
            .multilineTextAlignment(.leading)
            .padding(.vertical)
    }
    
    private var productCartCount: some View {
        HStack(spacing: 20) {
            createButton(for: "minus") {
                guard count > 0 else {return}
                count -= 1
            }
            
            Text(count.description)
                .font(.title2)
                .foregroundColor(.gray)
            
            createButton(for: "plus") {
                count += 1
            }
            
            Spacer()
            favoriteButton
        }
        
    }
    
    private func createButton(for systemName: String, onTapAction: @escaping (() -> Void)) -> some View {
        Button(action: onTapAction) {
            Image(systemName: systemName)
                .font(.title2)
                .foregroundColor(.gray)
                .frame(width: 35, height: 35)
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
        }
    }

    
    
    private var favoriteButton: some View {
        Button {
            //
        } label: {
            Image(systemName: "suit.heart.fill")
                .foregroundColor(.white)
                .font(.title2)
                .padding(10)
                .background(Color.red)
                .clipShape(Circle())
        }

    }
    
}

struct ProductDetailsView_Previews: PreviewProvider {
    @Namespace static var namespace

    static var previews: some View {
        ProductDetailsView(product: .constant(Product.placeholders.first!), show: .constant(true), animation: namespace)
    }
}
