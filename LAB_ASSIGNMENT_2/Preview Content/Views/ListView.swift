import SwiftUI
import CoreData

struct ListView: View {
    @Environment(\.managedObjectContext) private var viewContext
        @State private var showingAddProductSheet = false
    
    @FetchRequest(
        entity: Product.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Product.name, ascending: true)]
    ) var products: FetchedResults<Product>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(products) { product in
                    NavigationLink(destination: DetailsListView(product: product)) {
                        Text(product.name ?? "Unknown Product")
                    }
                }
            }
            .navigationBarTitle("Products")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
