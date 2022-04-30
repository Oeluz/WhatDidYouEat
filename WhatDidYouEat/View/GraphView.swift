//
//  GraphView.swift
//  WhatDidYouEat
//
//  Created by Zhencheng Chen on 4/22/22.
//

import SwiftUI
import SwiftUICharts

//https://github.com/AppPear/ChartView


struct GraphView: View {
    @ObservedObject var foodListVM: FoodListViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                //GradientColor(start: Color, end: Color)
                
                LineChartView(data: foodListVM.getDataCalories(), title: "Calorie", form: ChartForm.large)
//                LineChartView(data: data.first(where: ), title: "Calorie", form: ChartForm.large)

                MultiLineChartView(data: [(foodListVM.getDataCarb(), GradientColors.green), (foodListVM.getDataProtein(), GradientColors.purple), (foodListVM.getDataFat(), GradientColors.orngPink)], title: "Protein/Fat/Carb", form: ChartForm.large)
                
                BarChartView(data: ChartData(points: foodListVM.getDataCarb()), title: "Carb", form: ChartForm.large) // legend is optional
                
                BarChartView(data: ChartData(points: foodListVM.getDataProtein()), title: "Protein", form: ChartForm.large) // legend is optional
                
                BarChartView(data: ChartData(points: foodListVM.getDataFat()), title: "Fat", form: ChartForm.large) // legend is optional
                
//                PieChartView(data: [8,23,54,32], title: "Title", legend: "Legendary", form: ChartForm.large) // legend is optional

            }
            .padding()
            .edgesIgnoringSafeArea(.all)
        }
    }
}
