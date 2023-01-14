import SwiftUI

struct ReservationView: View {
    @EnvironmentObject var model: Model
    var body: some View {
        let restaurant = model.reservation.restaurant
        
        ScrollView {
            VStack {
                LittleLemonLogo()
                    .padding(.bottom, 20)
                
                if restaurant.city.isEmpty {
                    VStack {
                        Text("No Reservations Yet")
                            .foregroundColor(.gray)
                    }
                    .frame(maxHeight:.infinity)
                } else {
                    Text("Reservation")
                        .padding([.leading, .trailing], 40)
                        .padding([.top, .bottom], 8)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(20)
                        .padding(.bottom, 20)
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Restaurant")
                                .font(.subheadline)
                                .padding(.bottom, 5)
                            RestaurantView(restaurant)
                        }
                        Spacer()
                    }
                    .frame(maxWidth:.infinity)
                    .padding(.bottom, 20)
                    Divider()
                        .padding(.bottom, 20)
                    
                    
                    VStack {
                        HStack {
                            Text("Name: ")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                            
                            Text(model.reservation.customerName)
                            Spacer()
                        }
                        
                        HStack {
                            Text("Email: ")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                            
                            Text(model.reservation.customerEmail)
                            Spacer()
                        }
                        
                        HStack {
                            Text("Phone: ")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                            
                            Text(model.reservation.customerPhoneNumber)
                            Spacer()
                        }
                        
                    }
                    .padding(.bottom, 20)
                    
                    
                    HStack {
                        Text("Party: ")
                            .foregroundColor(.gray)
                        
                            .font(.subheadline)
                        
                        Text("\(model.reservation.party)")
                        Spacer()
                    }
                    .padding(.bottom, 20)
                    
                    VStack {
                        HStack {
                            Text("DATE: ")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                            
                            Text(model.reservation.reservationDate, style: .date)
                            Spacer()
                        }
                        
                        HStack {
                            Text("TIME: ")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                            
                            Text(model.reservation.reservationDate, style: .time)
                            Spacer()
                        }
                    }
                    .padding(.bottom, 20)
                    
                    HStack {
                        VStack (alignment: .leading) {
                            Text("SPECIAL REQUESTS:")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                            Text(model.reservation.specialRequests)
                        }
                        Spacer()
                    }
                    .frame(maxWidth:.infinity)
                    
                }
            }
        }
        .padding(50)
    }
}

struct ReservationView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationView()
    }
}
