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
            NavigationView {
                List {
                    ForEach(products, id: \.id) { product in
                        NavigationLink(destination: DetailsListView(product: product)) {
                            Text(product.name ?? "Unknown Product")
                        }
                    }
                    .onDelete(perform: deleteProducts)
                }
                .navigationTitle("Products")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            showingAddProductSheet = true
                        }) {
                            Label("Add Product", systemImage: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showingAddProductSheet) {
                    AddProductView(isPresented: $showingAddProductSheet)
                        .environment(\.managedObjectContext, viewContext)
                }
            }
        }
}
