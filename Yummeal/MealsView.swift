//
//  MealsView.swift
//  Yummeal
//
//  Created by samanyu rao on 1/29/26.
//

import Foundation
import SwiftUI
enum Difficulty: String, CaseIterable, Identifiable {
    case easy, medium, hard
    var id: String { rawValue }
}
struct Meal : Identifiable, Hashable {
    let id: UUID = UUID();
    let name: String;
    let description: String;
let cookingTime: Duration;
    let difficulty: Difficulty;
}
struct Meal2sView: View {
   var body: some View {
        Text("Meals  new View")
   }
}
//// Placeholder for next screen
struct MealsView: View {
    @State private var meals: [Meal] = [
        Meal(name: "Spaghetti Carbonara", description: "Spaghetti with creamy egg sauce and pancetta", cookingTime: Duration.seconds(20*60), difficulty: .easy),
        Meal(name: "Beef Wellington", description: "Beef tenderloin wrapped in puff pastry and baked to perfection", cookingTime: .seconds(45.0*60), difficulty: .medium),
        Meal(name: "Chocolate Lava Cake", description: "Rich and fudgy chocolate cake with a gooey molten center", cookingTime: .seconds(30.0*60), difficulty: .hard),
        Meal(name: "Margherita Pizza", description: "Classic Italian pizza with fresh mozzarella, tomatoes, and basil", cookingTime: .seconds(15.0*60), difficulty: .easy),
        Meal(name: "Tarte Tatin aux Tomates", description: "tomato and puff pastry tart with a buttery flaky crust", cookingTime: .seconds(40.0*60), difficulty: .medium)
    ]
   var body: some View {

       ZStack{
           LinearGradient(
               colors: [Color.orange.opacity(0.6), Color.yellow.opacity(0.4)],
               startPoint: .topLeading,
               endPoint: .bottomTrailing
           )
           .ignoresSafeArea()
           
           ScrollView(.vertical, showsIndicators: false){
               LazyVGrid(columns: [GridItem(.adaptive(minimum: 150, maximum: 200))], spacing: 20){
                   ForEach(meals){ meal in
                       MealCard(meal: meal)
                   }
               }
           }
       }
   }
}

struct MealCard: View {
    let meal: Meal
    var body: some View{
        
        NavigationLink(destination: RecipeView())
        {
            VStack(alignment: .leading, spacing: 10){
                Text(meal.name)
                    .font(.headline)
                Text(meal.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                HStack{
                    Text("\u{1f551} \(meal.cookingTime, format: .time(pattern: .hourMinute))")
                    Spacer()
                    Text("\u{1f333} \(meal.difficulty.rawValue.capitalized)")
                }
                    
                
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 150)
        .background(     RoundedRectangle(cornerRadius: 16)
            .fill(Color.orange.opacity(0.5))
            .cornerRadius(10)
        )
    }
}


#Preview {
    NavigationStack {
        MealsView()
    }
}
