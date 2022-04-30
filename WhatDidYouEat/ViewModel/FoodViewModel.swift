//
//  FoodViewModel.swift
//  WhatDidYouEat
//
//  Created by Zhencheng Chen on 4/27/22.
//

import Foundation
import Combine

class FoodViewModel: ObservableObject, Identifiable {
    
    private let foodRepo = FoodRepo()
    @Published var food: Food
    
    private var cancellables: Set<AnyCancellable> = []
    
    var id = ""
    
    init(food: Food) {
        self.food = food
        // 5
        $food
            .compactMap { $0.id.uuidString }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
    
    func update(food: Food) {
      foodRepo.update(food)
    }
    
    func remove() {
      foodRepo.remove(food)
    }
}
