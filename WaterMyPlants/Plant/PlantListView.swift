//
//  PlantListView.swift
//  WaterMyPlants
//
//  Created by Toomas Vahter on 12.01.2020.
//  Copyright © 2020 Augmented Code. All rights reserved.
//

import SwiftUI

struct PlantListView: View {
    @Environment(\.self) var environment
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        NavigationView {
            List(self.viewModel.plants) { plant in
                Text(plant.name)
            }.navigationBarTitle("Plants")
                .navigationBarItems(trailing: navigationBarTrailingItem)
        }
    }
    
    private var navigationBarTrailingItem: some View {
        Button(action: {
            self.viewModel.isPresentingAddPlant = true
        }, label: {
            Image(systemName: "plus").frame(minWidth: 32, minHeight: 32)
        }).sheet(isPresented: self.$viewModel.isPresentingAddPlant) {
            self.makeAddPlantView()
        }
    }
    
    private func makeAddPlantView() -> AddPlantView {
        let viewModel = AddPlantView.ViewModel(managedObjectContext: environment.managedObjectContext)
        return AddPlantView(viewModel: viewModel)
    }
}

struct PlantListView_Previews: PreviewProvider {
    static let dependencyContainer: DependencyContainer = {
        let container = DependencyContainer()
        container.loadDependencies {}
        return container
    }()
    
    static var previews: some View {
        PlantListView(viewModel: PlantListView.ViewModel(managedObjectContext: dependencyContainer.persistentContainer.viewContext))
    }
}
