import SwiftUI
import module_root
import module_feature_a
import module_feature_b


struct ContentView: View {
    var body: some View {
        VStack {
            Text("\(FEATURE_A_STRING)")
            Text("\(FEATURE_B_STRING)")
            Text(ROOT_DATE?.toString() ?? "wrong date")
            Text(FEATURE_B_DATE?.toString() ?? "wrong date")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
