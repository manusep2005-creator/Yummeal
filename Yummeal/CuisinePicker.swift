//
//  CuisinePicker.swift
//  YumMeal-IW
//
//  Created by Arpana Koilada on 12/6/25.
//

import SwiftUI
struct Cuisine: Identifiable {
    let id = UUID()
    let name: String
    let emoji: String
    var isSelected: Bool = false
}

struct CuisineSelectionView: View {
    @State private var cuisines: [Cuisine] = [
        Cuisine(name: "Italian", emoji: "🍝"),
        Cuisine(name: "Mexican", emoji: "🌮"),
        Cuisine(name: "Japanese", emoji: "🍣"),
        Cuisine(name: "Chinese", emoji: "🥡"),
        Cuisine(name: "Indian", emoji: "🍛"),
        Cuisine(name: "Thai", emoji: "🍜"),
        Cuisine(name: "American", emoji: "🍔"),
        Cuisine(name: "Mediterranean", emoji: "🥗"),
        Cuisine(name: "Korean", emoji: "🍲"),
        Cuisine(name: "French", emoji: "🥐"),
        Cuisine(name: "Vietnamese", emoji: "🍜"),
        Cuisine(name: "Greek", emoji: "🫒"),
        Cuisine(name: "Spanish", emoji: "🥘"),
        Cuisine(name: "Middle Eastern", emoji: "🧆"),
        Cuisine(name: "Caribbean", emoji: "🥥"),
        Cuisine(name: "Ethiopian", emoji: "🫓"),
        Cuisine(name: "Brazilian", emoji: "🥩"),
        Cuisine(name: "Southern", emoji: "🍗")
    ]
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    //counts the number of items selected
    //isSelected turns True of item is clicked
    var selectedCount: Int {
        cuisines.filter { $0.isSelected }.count
    }
    
    var body: some View {
        //Z stack to stack all the elements of the page on top of each other
        ZStack {
            // Background gradient (matching login)
            LinearGradient(
                colors: [Color.orange.opacity(0.6), Color.yellow.opacity(0.4)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            // Floating shapes (matching login)
            Circle()
                .fill(Color.white.opacity(0.2))
                .scaleEffect(1.5)
                .offset(x: -150, y: -350)
            
            Circle()
                .fill(Color.white.opacity(0.2))
                .scaleEffect(2)
                .offset(x: 250, y: 250)
            
            VStack(spacing: 24) {
                // Header
                VStack(spacing: 8) {
                    Text("What do you love to eat?")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    
                    Text("Select your favorite cuisines")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundColor(.white.opacity(1))
                    
                    //if user clicks at least one, number of selected is upated
                    if selectedCount > 0 {
                        Text("\(selectedCount) selected")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.orange)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 4)
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(12)
                    }
                }
                //padding for entire VStack
                .padding(.top, 60)
                
                // Cuisine Grid
                
                //Call columns and create grid
                //for every cuisine, make a card for each one in the grid view (call CusineCard)
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach($cuisines) { $cuisine in
                            CuisineCard(cuisine: $cuisine)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 100)
                }
                
                Spacer()
            }
            
            // Continue Button (fixed at bottom)
            VStack {
                Spacer()
                
                NavigationLink(destination: MealsView()) {
                    HStack {
                        Text("Continue")
                            .font(.headline)
                        Image(systemName: "arrow.right")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    //If user selects more than three than bold the Continue button
                    .background(selectedCount >= 3 ? Color.orange : Color.orange.opacity(0.5))
                    .foregroundColor(.white)
                    .cornerRadius(14)
                    .shadow(color: .orange.opacity(0.4), radius: 5, x: 0, y: 4)
                }
                //If the number of cards selected is less than 3 then disable the function of the button
                .disabled(selectedCount < 3)
                .padding(.horizontal, 32)
                .padding(.bottom, 30)
                
                Text("Select at least 3 cuisines")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(.orange.opacity(1))
                    .padding(.bottom, 16)
            }
        }
        .navigationBarBackButtonHidden(false)
    }
}

struct Meal1sView: View {
   var body: some View {
        Text("Meals View")
   }
}

struct CuisineCard: View {
    @Binding var cuisine: Cuisine
    
    var body: some View {
        Button(action: {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                cuisine.isSelected.toggle()
            }
        }) {
            VStack(spacing: 8) {
                Text(cuisine.emoji)
                    .font(.system(size: 36))
                
                Text(cuisine.name)
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(cuisine.isSelected ? .white : .orange)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 100)
            .background(
                //if card is selected (if isSelected is True) fill card to be orange
                RoundedRectangle(cornerRadius: 16)
                    .fill(cuisine.isSelected ? Color.orange : Color.white.opacity(0.9))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                //if card is selected (if isSelected is True) then add a border/stroke to be white
                    .stroke(cuisine.isSelected ? Color.white : Color.clear, lineWidth: 2)
            )
            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
            .scaleEffect(cuisine.isSelected ? 1.05 : 1.0)
        }
    }
}



#Preview {
    NavigationStack {
        CuisineSelectionView()
    }
}
//
//  CuisinePicker.swift
//  recipe-app
//
//  Created by samanyu rao on 1/29/26.
//

