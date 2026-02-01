//
//  RecipeView.swift
//  Yummeal
//
//  Created by samanyu rao on 1/31/26.
//

import SwiftUI

struct RecipeView: View {
    var body: some View {
        Text("Recipe View")
        ZStack{
            LinearGradient(
                colors: [Color.orange.opacity(0.6), Color.yellow.opacity(0.4)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            
    
            }
        }
}

#Preview {
    RecipeView()
}
