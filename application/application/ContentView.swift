import SwiftUI
import module_feature_a
import module_feature_b
import module_root

struct ContentView: View {
    var body: some View {
        VStack {
            Text("\(FROM_FEATURE_A)")
            Text("\(FROM_FEATURE_B)")
            //Text(FROM_ROOT_DATE?.toString() ?? "wring date")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
