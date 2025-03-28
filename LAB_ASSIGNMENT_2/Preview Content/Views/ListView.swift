import SwiftUI
import CoreData

struct ListView<Content: View>: View {
    @Environment(\.managedObjectContext) private var viewContext
        @State private var showingAddProductSheet = false
    
    @FetchRequest(
        entity: Product.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Product.name, ascending: true)]
    ) var products: FetchedResults<Product>
    
    var body: some View {
        
        }
    }
}
