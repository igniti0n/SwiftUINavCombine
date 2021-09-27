//
//  User+CoreDataProperties.swift
//  Cordinator-Combine-Example
//
//  Created by Ivan Stajcer on 27.09.2021..
//
//

import Foundation
import CoreData


extension User {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }
    
    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var about: String?
    @NSManaged public var friends: NSSet?
    
    var wrappedId: String {
        id ?? UUID.init().uuidString
    }
    var wrappedName: String {
        name ?? "Unknown name."
    }
    var wrappedAbout: String {
        about ?? "Unknown about."
    }
    var wrappedFriends: [FriendModel] {
        let friendsSet = friends as? Set<Friend> ?? []
        
        let friendModels =  friendsSet.map { friend in
            return FriendModel(id: friend.wrappedId, name: friend.wrappedName)
        }
        
        return friendModels
    }
    
}

// MARK: Generated accessors for friends
extension User {
    
    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: Friend)
    
    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: Friend)
    
    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)
    
    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)
    
}

extension User : Identifiable {
    
}
