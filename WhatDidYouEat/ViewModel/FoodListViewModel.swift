//
//  FoodListViewModel.swift
//  WhatDidYouEat
//
//  Created by Zhencheng Chen on 4/27/22.
//

import Foundation
import Combine
import SwiftUI

class FoodListViewModel: ObservableObject {
    
    @Published var repo = FoodRepo()
    
    @Published var foodVMs: [FoodViewModel] = []
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        repo.$foods.map { foods in
            foods.map(FoodViewModel.init)
        }
        
        .assign(to: \.foodVMs, on: self)
        
        .store(in: &cancellables)
    }
    
    // 4
    func add(_ food: Food) {
        repo.add(food)
    }
    
    func getDataCalories() -> [Double] {
        let list = getFoodSevenDays()
        var calories: [Double] = []

        list.forEach { arr in
            var calorie = 0.0
            arr.forEach { vm in
                calorie += Double(vm.food.calorie)
            }
            calories.append(calorie)
        }
        
        return calories
    }
    
    func getDataProtein() -> [Double] {
        let list = getFoodSevenDays()
        var proteins: [Double] = []

        list.forEach { arr in
            var protein = 0.0
            arr.forEach { vm in
                protein += Double(vm.food.protein)
            }
            proteins.append(protein)
        }
        
        return proteins
    }
    
    func getDataCarb() -> [Double] {
        let list = getFoodSevenDays()
        var carbs: [Double] = []

        list.forEach { arr in
            var carb = 0.0
            arr.forEach { vm in
                carb += Double(vm.food.carb)
            }
            carbs.append(carb)
        }
        
        return carbs
    }
    
    func getDataFat() -> [Double] {
        let list = getFoodSevenDays()
        var fats: [Double] = []

        list.forEach { arr in
            var fat = 0.0
            arr.forEach { vm in
                fat += Double(vm.food.fat)
            }
            fats.append(fat)
        }
        return fats
    }
    
    private func getFoodSevenDays() -> [[FoodViewModel]] {
        var list: [[FoodViewModel]] = []
        
        var comp = DateComponents()
        comp.day = -1
        let current = Calendar.current
        for i in -7 ... -1 {
            comp.day = i
            let previousDate = current.date(byAdding: comp, to: Date())!
            
            let foods: [FoodViewModel] = foodVMs.filter { Calendar.current.isDate($0.food.date, inSameDayAs: previousDate)}
            
            list.append(foods)
        }
        
        return list
    }
}
