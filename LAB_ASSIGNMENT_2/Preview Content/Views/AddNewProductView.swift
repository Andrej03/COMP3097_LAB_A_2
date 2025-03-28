import SwiftUI
import CoreData

struct AddNewProductView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Binding var isPressed: Bool
    
    // State variables for the new product’s details
    @State private var productID = ""
    @State private var productName = ""
    @State private var productDescription = ""
    @State private var productPrice = ""
    @State private var productProvider = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Product Details")) {
                    TextField("Product ID", text: $productID)
                    TextField("Product Name", text: $productName)
                    TextField("Product Description", text: $productDescription)
                    TextField("Product Price", text: $productPrice)
                        .keyboardType(.decimalPad)
                    TextField("Product Provider", text: $productProvider)
                }
            }
            .navigationTitle("Add New Product")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        saveProduct()
                        isPressed = false // Dismiss view after saving
                    }
                    // Disable the button if any field is empty
                    .disabled(productID.isEmpty ||
                              productName.isEmpty ||
                              productDescription.isEmpty ||
                              productPrice.isEmpty ||
                              productProvider.isEmpty)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        isPressed = false
                    }
                }
            }
        }
    }
    
    // Save function creates a new Product in Core Data
    private func saveProduct() {
            let newProduct = Product(context: viewContext)
            newProduct.id = productID
            newProduct.name = productName
            newProduct.desc = productDescription
            newProduct.price = productPrice
            newProduct.provider = productProvider
        }
}
