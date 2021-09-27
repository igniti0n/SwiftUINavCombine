//
//  Friend+CoreDataProperties.swift
//  Cordinator-Combine-Example
//
//  Created by Ivan Stajcer on 27.09.2021..
//
//

import Foundation
import CoreData


extension Friend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friend> {
        return NSFetchRequest<Friend>(entityName: "Friend")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    
    var wrappedId: String {
        id ?? UUID.init().uuidString
    }
    
    var wrappedName: String {
        name ?? "Unknown friend."
    }

}

extension Friend : Identifiable {

}
