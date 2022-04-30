//
//  ListView.swift
//  WhatDidYouEat
//
//  Created by Zhencheng Chen on 4/22/22.
//

import SwiftUI

struct ListView: View {
    
    @State var popup = false
    
    @ObservedObject var foodListVM: FoodListViewModel
    
    var body: some View {
        VStack {
            List(foodListVM.repo.foods) { food in

                HStack {
                    Text(food.name)
                        .font(.largeTitle)

                    Text("\(food.calorie ?? 0)")
                        .font(.body)
                }
            }
//            ForEach(cardListViewModel.cardViewModels) { cardViewModel in
//              CardView(cardViewModel: cardViewModel)
//                .padding([.leading, .trailing])
//            }
            
            Spacer()
            
            Button {
                popup = true
            } label: {
                Image(systemName: "plus")
            }
            .foregroundColor(.white)
            .background(.blue)
            .clipShape(Capsule())
            .padding()
        }
        .sheet(isPresented: $popup) {
            AddFoodView(foodListVM: foodListVM, isShown: $popup)
        }

        
    }
}

struct AddFoodView: View {
    
    @State var name: String = ""
    @State var calorie: String = ""
    @State var protein: String = ""
    @State var carb: String = ""
    @State var fat: String = ""
    @State var type: String = ""
    @State var portion: String = ""
    @State var date: Date = Date()
    
    @ObservedObject var foodListVM: FoodListViewModel
    
    @Binding var isShown: Bool

    
    var body: some View {
        VStack {
            HStack {
                Text("Name: ")
                TextField("Enter a name", text: $name)
                    .border(.secondary)
            }
            HStack {
                Text("Calorie: ")
                TextField("Enter calorie", text: $calorie)
                    .border(.secondary)
            }
            HStack {
                Text("Protein: ")
                TextField("Enter protein", text: $protein)
                    .border(.secondary)
            }
            HStack {
                Text("Carb: ")
                TextField("Enter carb", text: $carb)
                    .border(.secondary)
            }
            HStack {
                Text("Fat: ")
                TextField("Enter fat", text: $fat)
                    .border(.secondary)
            }
            HStack {
                Text("Portion: ")
                TextField("Enter portion", text: $portion)
                    .border(.secondary)
                
            }
            
            DatePicker(selection: $date, label: { Text("Date") })
            
            HStack {
                Button {
                    addFood()
                } label: {
                    Text("Add")
                }
                
                Button {
                    
                } label: {
                    Text("Cancel")
                }
            }
        }
        .padding()
    }
    
    private func addFood() {
        do {
            let food = Food(name: name, date: date, calorie: Int(calorie) ?? 0, fat: Int(fat) ?? 0, protein: Int(protein) ?? 0, carb: Int(carb) ?? 0, portion: Int(portion) ?? 0)
            
            foodListVM.add(food)
        } catch {
            print("something went wrong")
        }
        isShown = false
    }
}
