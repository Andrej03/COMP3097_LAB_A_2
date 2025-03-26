import CoreData

// MARK: - Core Data Persistence Controller
struct PersistenceController {
    // Shared instance for the app
    static let shared = PersistenceController()
    
    // For previews in SwiftUI
    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)
        let context = controller.container.viewContext
        
        // Create sample data for previews
        Product.createSampleProducts(in: context)
        
        return controller
    }()
    
    // The Core Data container
    let container: NSPersistentContainer
    
    // Initialize the Core Data stack
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "ProductApp")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error loading Core Data stores: \(error.localizedDescription)")
            }
        }
        
        // Merge policies for better conflict handling
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    }
    
    // Check if any products exist, if not create sample data
    func initializeDataIfNeeded() {
        let context = container.viewContext
        
        let fetchRequest: NSFetchRequest<Product> = Product.fetchRequest()
        let count = (try? context.count(for: fetchRequest)) ?? 0
        
        if count == 0 {
            Product.createSampleProducts(in: context)
        }
    }
}
Last edited 22 minutes ago


