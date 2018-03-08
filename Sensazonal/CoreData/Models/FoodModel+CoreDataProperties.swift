//
//  FoodModel+CoreDataProperties.swift
//  Sensazonal
//
//  Created by Ronan Rodrigo Nunes on 08/03/18.
//  Copyright © 2018 Ronan Rodrigo Nunes. All rights reserved.
//
//

import Foundation
import CoreData


extension FoodModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FoodModel> {
        return NSFetchRequest<FoodModel>(entityName: "FoodModel")
    }

    @NSManaged public var name: String?
    @NSManaged public var photo: NSData?

}
