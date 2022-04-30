//
//  Food.swift
//  WhatDidYouEat
//
//  Created by Zhencheng Chen on 4/22/22.
//

import Foundation

class Food: NSObject, Identifiable, Codable {
    var id = UUID()
    
    var name: String
    var date: Date
    var calorie: Int
    var fat: Int
    var protein: Int
    var carb: Int
    var portion: Int
    
    init(name: String, date: Date, calorie: Int, fat: Int, protein: Int, carb: Int, portion: Int) {
        self.name = name
        self.date = date
        self.calorie = calorie
        self.fat = fat
        self.protein = protein
        self.carb = carb
        self.portion = portion
    }
    
    func toString() -> String {
        return """
        Name:       \(name)
        Date:       \(date)
        Calorie:    \(String(describing: calorie))
        Fat:        \(String(describing: fat))
        Protein:    \(String(describing: protein))
        Carb:       \(String(describing: carb))
        Portion:    \(String(describing: portion))
        """
    }
    
}
