//
//  Plant.swift
//  WaterMyPlans
//
//  Created by Toomas Vahter on 12.01.2020.
//  Copyright © 2020 Augmented Code. All rights reserved.
//

import CoreData

final class Plant: NSManagedObject, Identifiable {
    @NSManaged var name: String
}

extension Plant {
    static let entityName = "Plant"
    
    static func makeRequest() -> NSFetchRequest<Plant> {
        return NSFetchRequest<Plant>(entityName: entityName)
    }
    
    static func insert(withName name: String, into context: NSManagedObjectContext) -> Plant {
        let plant = NSEntityDescription.insertNewObject(forEntityName: entityName, into: context) as! Plant
        plant.name = name
        return plant
    }
    
    static func allPlantsController(context: NSManagedObjectContext, sortDescriptors: [NSSortDescriptor] = []) -> NSFetchedResultsController<Plant> {
        let request = makeRequest()
        request.sortDescriptors = sortDescriptors.isEmpty ? nil : sortDescriptors
        return NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
    }
}
