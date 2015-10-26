//
//  CDProduct+CoreDataProperties.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/25/15.
//  Copyright © 2015 Protogres. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension CDProduct {

    @NSManaged var id: NSNumber?
    @NSManaged var title: String?
    @NSManaged var category: String?
    @NSManaged var thumbnailURL: String?
    @NSManaged var weight: String?
    @NSManaged var warranty: String?
    @NSManaged var additional: String?
    @NSManaged var price: String?

}
