import SwiftUI

struct ReservationForm: View {
    @EnvironmentObject var model: Model
    @State var showFormInvalidMessage = false
    @State var errorMessage = ""
    
    private var restaurant: RestaurantLocation
    @State var reservationDate = Date()
    @State var party: Int = 1
    @State var specialRequests: String = ""
    @State var customerName: String = ""
    @State var customerPhoneNumber: String = ""
    @State var customerEmail: String = ""
    
    // this environment variable stores the presentation mode status
    // of this view. This will be used to dismiss this view when
    // the user taps on the RESERVE
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var temporaryReservation = Reservation()
    
    @State var mustChangeReservation = false
    
    init(_ restaurant:RestaurantLocation) {
        self.restaurant = restaurant
    }
    
    var body: some View {
        VStack {
            Form {
                RestaurantView(restaurant)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Party")
                            .font(.subheadline)
                        
                        TextField("",
                                  value: $party,
                                  formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                        .onChange(of: party) { value in
                            if value == 0 {
                                party = 1
                            }
                        }
                    }
                    
                    VStack {
                        DatePicker(selection: $reservationDate, in: Date()...,
                                   displayedComponents: [.date, .hourAndMinute]) {
                        }
                    }
                }
                .padding([.top, .bottom], 20)
                
                Group {
                    Group {
                        HStack {
                            Text("Name: ")
                                .font(.subheadline)
                            
                            TextField("Your name...", text: $customerName)
                        }
                        HStack {
                            Text("PHONE: ")
                                .font(.subheadline)
                            
                            TextField("Your phone number...", text: $customerPhoneNumber)
                            .textContentType(.telephoneNumber)
                            .keyboardType(.phonePad)
                        }
                        HStack {
                            Text("E-MAIL: ")
                                .font(.subheadline)
                            
                            TextField("Your e-mail...", text: $customerEmail)
                            .keyboardType(.emailAddress)
                            .textContentType(.emailAddress)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                        }
                        TextField("add any special request (optional)",
                                  text: $specialRequests,
                                  axis:.vertical)
                        .padding()
                        .overlay( RoundedRectangle(cornerRadius: 20).stroke(.gray.opacity(0.2)) )
                        .lineLimit(6)
                        .padding([.top, .bottom], 20)
                    }
                }
                .padding(.top, -40)
                .scrollContentBackground(.hidden)
                .onChange(of: mustChangeReservation) { _ in
                    model.reservation = temporaryReservation
                }
                .alert("ERROR", isPresented: $showFormInvalidMessage, actions: {
                    Button("OK", role: .cancel) { }
                }, message: {
                    Text(self.errorMessage)
                })
            }
            .onAppear {
                model.displayingReservationForm = true
            }
            .onDisappear {
                model.displayingReservationForm = false
            }
        }
    }
}

struct ReservationForm_Previews: PreviewProvider {
    static var previews: some View {
        ReservationForm()
    }
}
