import SwiftUI

struct RestaurantView: View {
    private var restuarant: RestaurantLocation
    
    init(_ restuarant: RestaurantLocation) {
        self.restuarant = restuarant
    }
    
    var body: some View {
        VStack (alignment: .leading, spacing: 3) {
            Text(restuarant.city)
                .font(.title2)
            
            HStack {
                Text(restuarant.neighborhood)
                Text("-")
                Text(restuarant.phoneNumber)
            }
            .font(.caption)
            .foregroundColor(.gray)
        }
    }
}
