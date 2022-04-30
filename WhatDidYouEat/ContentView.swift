//
//  ContentView.swift
//  WhatDidYouEat
//
//  Created by Zhencheng Chen on 4/27/22.
//

import SwiftUI

enum Tabs: Hashable {
    case List
    case Graph
    case Add
    case Setting
}

struct ContentView: View {
    @State var selected = Tabs.List
    @State var foodVM = FoodListViewModel()

        var body: some View {
            TabView(selection: $selected) {
                ListView(foodListVM: foodVM)
                    .tabItem {
                        Image(systemName: "list.star")
                        Text("List")
                    }
                    .tag(Tabs.List)
                
                GraphView(foodListVM: foodVM)
                    .tabItem {
                        Image(systemName: "chart.bar")
                        Text("Graph")
                    }
                    .tag(Tabs.Graph)
//
//                AddView()
//                    .tabItem {
//                        Image(systemName: "plus.square.on.square")
//                        Text("Add")
//                    }
//                    .tag(Tabs.Add)
//
//                SettingView()
//                    .tabItem {
//                        Image(systemName: "gear")
//                        Text("Setting")
//                    }
//                    .tag(Tabs.Setting)
            }
        }
}

