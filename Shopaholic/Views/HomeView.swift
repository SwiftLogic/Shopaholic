//
//  HomeView.swift
//  Shopaholic
//
//  Created by Osaretin Uyigue on 6/18/23.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab: SwipeMenu = .handBag
    /// Powers tabIndcatorAnimation & animation to ProductDetailsView
    @Namespace private var animation
    @State private var show = false
    @State private var selectedProduct: Product?

    var body: some View {
        ZStack {
            // HomeView
            VStack(spacing: 0) {
                HomeNavBar()
                    .padding()
                    .background(Color.white)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                
                ScrollView {
                    VStack {
                        SectionTitle()
                            .padding()
                        SwipeMenuView(selectedTab: $selectedTab, animation: animation)
                        
                        ProductGridView(animation: animation, show: $show, selectedProduct: $selectedProduct)
                            .padding()
                    }
                }
            }
            .background(Color.black.opacity(0.05).ignoresSafeArea())
            
            if selectedProduct != nil && show {
                ProductDetailsView(product: $selectedProduct, show: $show)
            }
        }
//        .ignoresSafeArea()
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
    @Binding var selectedTab: SwipeMenu
    var animation: Namespace.ID
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(SwipeMenu.allCases, id: \.self) { tab in
                    TabButton(tabItem: tab, selectedTab: $selectedTab, animation: animation)
                }
            }
            .padding(.horizontal)
//            .padding(.top, 10)
        }
    }
}


private struct ProductGridView: View {
    var animation: Namespace.ID
    @Binding var show: Bool
    @Binding var selectedProduct: Product?
    
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 15) {
            ForEach(Product.placeholders) { product in
                Button {
                    withAnimation(.easeIn) {
                        selectedProduct = product
                        show.toggle()
                    }
                } label: {
                    ProductView(product: product, animation: animation)
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
