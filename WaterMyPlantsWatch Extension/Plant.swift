//
//  Plant.swift
//  WaterMyPlantsWatch Extension
//
//  Created by Toomas Vahter on 25.01.2020.
//  Copyright © 2020 Augmented Code. All rights reserved.
//

import Foundation

struct Plant: Decodable {
    let id: String
    let name: String
    let lastDate: Date
    let nextDate: Date
}
