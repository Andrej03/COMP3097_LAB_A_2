//import SwiftUI
//import CoreData
//
//struct ContentView: View {
//    @Environment(\.managedObjectContext) private var viewContext
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Product.name, ascending: true)],
//        animation: .default)
//    private var products: FetchedResults<Product>
//    
//    @State private var showingAddSheet = false
//    
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(products, id: \.id) { product in
//                    NavigationLink {
//                        ProductDetailView(product: product)
//                    } label: {
//                        VStack(alignment: .leading) {
//                            Text(product.name ?? "Unknown")
//                                .font(.headline)
//                            Text("$\(String(format: "%.2f", product.price)) - \(product.provider ?? "Unknown")")
//                                .font(.subheadline)
//                                .foregroundColor(.secondary)
//                        }
//                    }
//                }
//                .onDelete(perform: deleteProducts)
//            }
//            .navigationTitle("Products")
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button {
//                        showingAddSheet = true
//                    } label: {
//                        Label("Add Product", systemImage: "plus")
//                    }
//                }
//            }
//            .sheet(isPresented: $showingAddSheet) {
//                AddProductView()
//            }
//        }
//    }
//    
//    private func deleteProducts(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { products[$0] }.forEach(viewContext.delete)
//            
//            do {
//                try viewContext.save()
//            } catch {
//                print("Error deleting product: \(error)")
//            }
//        }
//    }
//}
