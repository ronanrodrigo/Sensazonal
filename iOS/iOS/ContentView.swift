import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            FoodCell()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
