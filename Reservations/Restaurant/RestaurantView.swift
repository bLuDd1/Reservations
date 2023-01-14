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

struct RestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        let sample = RestaurantLocation(city: "Las Vegas", neighborhood: "Downtown", phoneNumber: "(702) 555-9898")
        RestaurantView(sample)
    }
}
