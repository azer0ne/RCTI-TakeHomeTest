//
//  DataController.swift
//  RCTI+TakeHomeTest
//
//  Created by Abiyyu Firmansyah on 29/05/24.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    static let shared = DataController()

    let container: NSPersistentContainer
    init() {
        container = NSPersistentContainer(name: "Favorite")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data Failed to Load \(error.localizedDescription)")
            }
        }
    }
}
