//
//  ProductDetailsInfoPanView.swift
//  Shopaholic
//
//  Created by Osaretin Uyigue on 6/19/23.
//

import SwiftUI

struct ProductDetailsInfoPanView: View {
    let product: Product
    @Binding var selectedColor: Color
    @State private var count = 1
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                HStack {
                    productColorPickerView
                    Spacer()
                    productSizeTextView
                }
                productDescriptionTextView
                cartItemCountView
                buyNowButton
                    .padding(.top)
                    .padding(.bottom, windowBottomInset == 0 ? 15 : 0)
                Spacer()
            }
        }
    }
    
    var windowBottomInset: Int {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let window = windowScene.windows.first {
                let safeAreaInsetsBottom = window.safeAreaInsets.bottom
                let result = safeAreaInsetsBottom == 0 ? 15 : 0
                return result
            }
        }
        return 0
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
    
    private var cartItemCountView: some View {
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
    
    private let screenWidth = UIScreen.main.bounds.width
    private var buyNowButton: some View {
        Button {
            //
        } label: {
            Text("BUY NOW")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.vertical)
                .frame(width: screenWidth - 30)
                .background(Color(product.image))
                .clipShape(Capsule())
        }

    }
    
}


struct ProductDetailsInfoPanView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsInfoPanView(product: Product.placeholders[0], selectedColor: .constant(.yellow))
            .padding(.horizontal)
            .padding(.top, -20)
    }
}
