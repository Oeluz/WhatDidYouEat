//
//  FoodRepo.swift
//  WhatDidYouEat
//
//  Created by Zhencheng Chen on 4/27/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

class FoodRepo: ObservableObject {
    private let path = "food"
    private let store = Firestore.firestore()
    
    @Published var foods: [Food] = []
    
    init() {
        get()
    }
    
    func add(_ food: Food) {
        do {
            _ = try store.collection(path).addDocument(from: food)
        } catch {
            fatalError("Unable to add card: \(error.localizedDescription).")
        }
    }
    
    func get() {
        store.collection(path)
            .addSnapshotListener { querySnapshot, error in
                // 4
                if let error = error {
                    print("Error getting cards: \(error.localizedDescription)")
                    return
                }
                
                // 5
                self.foods = querySnapshot?.documents.compactMap { document in
                    // 6
                    try? document.data(as: Food.self)
                } ?? []
            }
    }
    
    func update(_ food: Food) {
        do {
            let id = food.id
            
            try store.collection(path).document(id.uuidString).setData(from: food)
        } catch {
            fatalError("Unable to update card: \(error.localizedDescription).")
        }
    }
    
    func remove(_ food: Food) {
        let id = food.id
        
        store.collection(path).document(id.uuidString).delete { error in
            if let error = error {
                print("Unable to remove card: \(error.localizedDescription)")
            }
        }
    }
}
