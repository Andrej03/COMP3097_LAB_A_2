import SwiftUI
import CoreData


func useSampleProductData(context: NSManagedObjectContext){
    
    let sampleProducts = [
        Product(id: "W001", name: "iPhone 15 Pro Max", desc: "The latest and greatest from Apple", price: 799.99, provider: "Rogers"),
        Product(id: "W002", name: "Samsung Galaxy S22 Ultra", desc: "Cutting-edge display and performance", price: 749.99, provider: "Bell"),
        Product(id: "W003", name: "Google Pixel 7 Pro", desc: "Pure Android experience with stellar camera", price: 699.99, provider: "Telus"),
        Product(id: "W004", name: "OnePlus 10 Pro", desc: "Speed and performance with OxygenOS", price: 649.99, provider: "Fido"),
        Product(id: "W005", name: "Sony Xperia 1 IV", desc: "Cinematic quality in a smartphone", price: 799.99, provider: "Virgin Mobile"),
        Product(id: "W006", name: "Huawei Mate 50 Pro", desc: "Innovative camera and powerful performance", price: 719.99, provider: "Koodo"),
        Product(id: "W007", name: "Xiaomi Mi 11 Ultra", desc: "Premium design meets high performance", price: 689.99, provider: "Chatr"),
        Product(id: "W008", name: "Motorola Edge 30 Pro", desc: "Sleek design with flagship specs", price: 599.99, provider: "Freedom Mobile"),
        Product(id: "W009", name: "Nokia 9.3 PureView", desc: "Robust design with powerful camera", price: 549.99, provider: "Public Mobile"),
        Product(id: "W010", name: "LG Velvet 2 Pro", desc: "Blend of style and performance", price: 499.99, provider: "Telus")
    ]
    
    for sampleData in sampleProducts {
            let product = Product(context: context)
            product.id = productData.id
            product.name = productData.name
            product.desc = productData.description
            product.price = productData.price
            product.provider = productData.provider
        }
    
    do {
            try context.save()
            print("Sample products created successfully")
        } catch {
            print("Failed to create sample products: \(error)")
        }
        
}
