import SwiftUI
import CoreData

struct DetailsListView: View {
    let product: Product
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Product ID
                VStack(alignment: .leading, spacing: 4) {
                    Text("Product ID")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text(product.id ?? "Unknown")
                        .font(.body)
                }
                
                // Product Name
                VStack(alignment: .leading, spacing: 4) {
                    Text("Product Name")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text(product.name ?? "Unknown")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                
                // Price
                VStack(alignment: .leading, spacing: 4) {
                    Text("Price")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text("$\(String(format: "%.2f", product.price))")
                        .font(.title3)
                        .foregroundColor(.green)
                }
                
                // Provider
                VStack(alignment: .leading, spacing: 4) {
                    Text("Provider")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text(product.provider ?? "Unknown")
                        .font(.body)
                }
                
                // Description
                VStack(alignment: .leading, spacing: 4) {
                    Text("Description")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text(product.desc ?? "No description available")
                        .font(.body)
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle(product.name ?? "Product Details")
    }
}
