//
//  ColorPickerButton.swift
//  Shopaholic
//
//  Created by Osaretin Uyigue on 6/19/23.
//

import SwiftUI

struct ColorPickerButton: View {
    var color: Color
    @Binding var selectedColor: Color
    
    var body: some View {
        Button {
            withAnimation {
                selectedColor = color
            }
        } label: {
            ZStack {
                Circle()
                    .fill(color)
                    .frame(width: 20, height: 20)
                
                Circle()
                    .stroke(Color.black.opacity(color == selectedColor ? 1 : 0), lineWidth: 1)
                    .frame(width: 30, height: 30)
            }
        }
        
    }
}

struct ColorPickerButton_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerButton(color: .red, selectedColor: .constant(.red))
    }
}
