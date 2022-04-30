//
//  WhatDidYouEat_Widget.swift
//  WhatDidYouEat-Widget
//
//  Created by Zhencheng Chen on 4/28/22.
//

import WidgetKit
import SwiftUI
import Intents


import Combine
import Foundation

struct FoodProvider: TimelineProvider {
    
    var foodVM = FoodListViewModel()
    
    func placeholder(in context: TimelineProvider.Context) -> FoodEntry {
        FoodEntry(date: Date(), calorie: Double(foodVM.getDataCalories()))
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<FoodEntry>) -> Void) {
        let date = Date()
        let entry = FoodEntry(date: date, calorie: 110)
        
        let update = Calendar.current.date(byAdding: .minute, value: 15, to: date)
        
        let timeline = Timeline(entries: [entry], policy: .after(update!))
        
        completion(timeline)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (FoodEntry) -> Void) {
        let entry: FoodEntry
        
        entry = FoodEntry(date: Date(), calorie: 150)
        
        completion(entry)
    }
    
}

struct FoodEntry: TimelineEntry {
    var date =  Date()
    var calorie: Double
}

@main
struct widgetView: Widget {
    init() {
        @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    }
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: "com.chen.whatdidyoueatwidget", provider: FoodProvider()) { entry in
            Text("test")
        }
        .configurationDisplayName("What Did You Eat")
        .description("Your daily intake")
        .supportedFamilies([.systemSmall])
    }
}

