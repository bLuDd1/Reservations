import SwiftUI

struct ReservationForm: View {
    @State var customerName: String = ""
    var body: some View {
        Form {
            TextField("Type Your Name", text: $customerName,
                      onEditingChanged: { status in
                print(status)
            })
                .onChange(of: customerName, perform: { newValue in
                    print(newValue)
                })
                .onSubmit {
                    print("submitted")
                }
        }
    }
}

struct ReservationForm_Previews: PreviewProvider {
    static var previews: some View {
        ReservationForm()
    }
}
