//
//  CDProduct+CoreDataProperties.swift
//  AreaHP
//
//  Created by wirawan sanusi on 10/27/15.
//  Copyright © 2015 Protogres. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension CDProduct {

    @NSManaged var additional: String?
    @NSManaged var category: String?
    @NSManaged var id: NSNumber?
    @NSManaged var price: String?
    @NSManaged var thumbnailURL: String?
    @NSManaged var title: String?
    @NSManaged var warranty: String?
    @NSManaged var weight: String?
    @NSManaged var thumbnailImage: NSData?

}
