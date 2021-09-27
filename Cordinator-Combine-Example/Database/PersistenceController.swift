import Foundation
import CoreData

struct PersistenceController {
    // A singleton for our entire app to use
    static let shared = PersistenceController()
    
    // Storage for Core Data
    let container: NSPersistentContainer
    
    // A test configuration for SwiftUI previews
    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)
        
        for _ in 0..<10 {
            let user = User(context: controller.container.viewContext)
            user.about = ""
            user.id = ""
            user.name = "name"
            user.friends = []
        }
        
        return controller
    }()
    
    // An initializer to load Core Data, optionally able
    // to use an in-memory store.
    init(inMemory: Bool = false) {
        // If you didn't name your model Main you'll need
        // to change this name below.
        container = NSPersistentContainer(name: "Model")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func save() {
        let context = container.viewContext
        
        print("Checking for changes...")
        
        if context.hasChanges {
            do {
                try context.save()
                print("Saving to db...")
            } catch {
                print("Saving data to disk failed.... \(error)")
            }
        }
    }
    
}
 
