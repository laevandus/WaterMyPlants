//
//  SceneDelegate.swift
//  WaterMyPlants
//
//  Created by Toomas Vahter on 12.01.2020.
//  Copyright © 2020 Augmented Code. All rights reserved.
//

import UIKit
import SwiftUI

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let dependencyContainer = (UIApplication.shared.delegate as! AppDelegate).dependencyContainer
        // TODO: Loading view
        dependencyContainer.loadDependencies {
            let managedObjectContext = dependencyContainer.persistentContainer.viewContext
            let viewModel = PlantListView.ViewModel(managedObjectContext: managedObjectContext)
            let contentView = PlantListView(viewModel: viewModel).environment(\.managedObjectContext, managedObjectContext)
            
            guard let windowScene = scene as? UIWindowScene else { return }
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
