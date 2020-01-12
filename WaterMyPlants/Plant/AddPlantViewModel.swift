//
//  AddPlantViewModel.swift
//  WaterMyPlans
//
//  Created by Toomas Vahter on 12.01.2020.
//  Copyright © 2020 Augmented Code. All rights reserved.
//

import Combine
import CoreData
import os
import SwiftUI

extension AddPlantView {
    final class ViewModel: ObservableObject {
        private let managedObjectContext: NSManagedObjectContext
        
        init(managedObjectContext: NSManagedObjectContext) {
            self.managedObjectContext = managedObjectContext
        }
        
        @Published var name: String = ""
        
        var canSave: Bool {
            return !name.isEmpty
        }
        
        func save() {
            let plant = Plant.insert(withName: name, into: managedObjectContext)
            guard managedObjectContext.saveIfNeeded() else { return }
            os_log(.debug, log: .plants, "added plant with name %s", plant.name)
        }
    }
}

fileprivate struct ComposedPlant {
    var name: String
}

