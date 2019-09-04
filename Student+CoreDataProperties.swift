//
//  Student+CoreDataProperties.swift
//  CoreDataPractice
//
//  Created by IMACDEV on 15/04/19.
//  Copyright © 2019 IMACDEV. All rights reserved.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var mobile: String?
    @NSManaged public var city: String?
    @NSManaged public var address: String?

}
