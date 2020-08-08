//
//  NutritionDetailView.swift
//  Bon Appetit
//
//  Created by Drew Volz on 8/4/20.
//

import SwiftUI

struct NutritionDetailView: View {
    @State var item: MenuResponse.Item
    
    var hasCaloriesLabel: Bool {
        item.nutritionDetails.calories?.label != nil
    }

    var body: some View {
        // Note: a cheap way to guess if there's items in the label to show
        if hasCaloriesLabel {
            List {
                NutritionLabelView()
            }
            .insetGroupedStyle()
        } else {
            NoData()
        }
    }
    
    @ViewBuilder func NoData() -> some View {
        VStack(spacing: 10) {
            Image(systemName: "tortoise")
            Text("Nutrition unavailable")
        }
        .font(Font.callout.weight(.light))
        .foregroundColor(.gray)
    }
    
    @ViewBuilder func NutritionLabelView() -> some View {
        // Note: we're limited to a max of 10 views...
        // pick one to cut? I've commented out one so
        // an error isn't thrown.
        Section(header: Text("Nutrition")) {
            HStack {
                Text(item.nutritionDetails.calories?.label ?? "")
                Spacer()
                HStack(alignment: .firstTextBaseline, spacing: 0) {
                    Text(item.nutritionDetails.calories?.value ?? "")
                    Text(item.nutritionDetails.calories?.unit ?? "")
                }
            }
            HStack {
                Text(item.nutritionDetails.servingSize?.label ?? "")
                Spacer()
                HStack(alignment: .firstTextBaseline, spacing: 0) {
                    Text(item.nutritionDetails.servingSize?.value ?? "")
                    Text(item.nutritionDetails.servingSize?.unit ?? "")
                }
            }
            HStack {
                Text(item.nutritionDetails.fatContent?.label ?? "")
                Spacer()
                HStack(alignment: .firstTextBaseline, spacing: 0) {
                    Text(item.nutritionDetails.fatContent?.value ?? "")
                    Text(item.nutritionDetails.fatContent?.unit ?? "")
                }
            }
            HStack {
                Text(item.nutritionDetails.saturatedFatContent?.label ?? "")
                Spacer()
                HStack(alignment: .firstTextBaseline, spacing: 0) {
                    Text(item.nutritionDetails.saturatedFatContent?.value ?? "")
                    Text(item.nutritionDetails.saturatedFatContent?.unit ?? "")
                }
            }
            HStack {
                Text(item.nutritionDetails.transFatContent?.label ?? "")
                Spacer()
                HStack(alignment: .firstTextBaseline, spacing: 0) {
                    Text(item.nutritionDetails.transFatContent?.value ?? "")
                    Text(item.nutritionDetails.transFatContent?.unit ?? "")
                }
            }
            //                HStack {
            //                    Text(item.nutritionDetails.cholesterolContent?.label ?? "")
            //                    Spacer()
            //                    HStack(alignment: .firstTextBaseline, spacing: 0) {
            //                        Text(item.nutritionDetails.cholesterolContent?.value ?? "")
            //                        Text(item.nutritionDetails.cholesterolContent?.unit ?? "")
            //                    }
            //                }
            HStack {
                Text(item.nutritionDetails.sodiumContent?.label ?? "")
                Spacer()
                HStack(alignment: .firstTextBaseline, spacing: 0) {
                    Text(item.nutritionDetails.sodiumContent?.value ?? "")
                    Text(item.nutritionDetails.sodiumContent?.unit ?? "")
                }
            }
            HStack {
                Text(item.nutritionDetails.carbohydrateContent?.label ?? "")
                Spacer()
                HStack(alignment: .firstTextBaseline, spacing: 0) {
                    Text(item.nutritionDetails.carbohydrateContent?.value ?? "")
                    Text(item.nutritionDetails.carbohydrateContent?.unit ?? "")
                }
            }
            HStack {
                Text(item.nutritionDetails.fiberContent?.label ?? "")
                Spacer()
                HStack(alignment: .firstTextBaseline, spacing: 0) {
                    Text(item.nutritionDetails.fiberContent?.value ?? "")
                    Text(item.nutritionDetails.fiberContent?.unit ?? "")
                }
            }
            HStack {
                Text(item.nutritionDetails.sugarContent?.label ?? "")
                Spacer()
                HStack(alignment: .firstTextBaseline, spacing: 0) {
                    Text(item.nutritionDetails.sugarContent?.value ?? "")
                    Text(item.nutritionDetails.sugarContent?.unit ?? "")
                }
            }
            HStack {
                Text(item.nutritionDetails.proteinContent?.label ?? "")
                Spacer()
                HStack(alignment: .firstTextBaseline, spacing: 0) {
                    Text(item.nutritionDetails.proteinContent?.value ?? "")
                    Text(item.nutritionDetails.proteinContent?.unit ?? "")
                }
            }
        }
    }
}

//struct NutritionDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        NutritionDetailView(item: MenuResponse.Item())
//    }
//}
