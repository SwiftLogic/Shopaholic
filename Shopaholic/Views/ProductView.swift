//
//  ProductView.swift
//  Shopaholic
//
//  Created by Osaretin Uyigue on 6/18/23.
//

import SwiftUI

struct ProductView: View {
    var bag: BagModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            
            ZStack {
                Color(bag.image)
                    .cornerRadius(15)
                
                Image(bag.image)
                    .resizable()
                    .scaledToFit()
                    .padding(20)
            }
            Text(bag.title)
                .fontWeight(.heavy)
                .foregroundColor(.gray)
            
            Text(bag.price)
                .fontWeight(.heavy)
                .foregroundColor(.black)
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(bag: BagModel.bags.first!)
    }
}
