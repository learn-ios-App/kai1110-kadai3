
import SwiftUI

struct ContentView: View {
    @State var textNumber1 = ""
    @State var textNumber2 = ""
    
    @State private var intNumber1 = 0
    @State private var intNumber2 = 0
    
    @State var signNumber1 = false
    @State var signNumber2 = false
    
    @State private var resultNumber = 0
    
    var body: some View {
        VStack(spacing: 30) {
            HStack(spacing: 30) {
                textFieldView(textNumber: $textNumber1)
                textFieldView(textNumber: $textNumber2)
            }
            HStack(spacing: 30) {
                toggleView(signNumber: $signNumber1)
                toggleView(signNumber: $signNumber2)
            }
            
            
            HStack(spacing: 30) {
                Text("\(intNumber1)")
                Image(systemName: "plus")
                Text("\(intNumber2)")
            }
            
            Button(action: {
                intNumber1 = parseNumber(number: textNumber1)
                if signNumber1 {
                    intNumber1 *= -1
                }
                intNumber2 = parseNumber(number: textNumber2)
                if signNumber2 {
                    intNumber2 *= -1
                }
                resultNumber = intNumber1 + intNumber2
            }) {
                Text("計算")
            }
            Text("\(resultNumber)")
        }
    }
    func parseNumber(number: String) -> Int {
        Int(number) ?? 0
    }
}

struct textFieldView: View {
    @Binding var textNumber: String
    
    var body: some View {
        HStack(spacing: 30) {
            TextField("", text: $textNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 100)
                .keyboardType(.numberPad)
        }
    }
}

struct toggleView: View {
    @Binding var signNumber: Bool
    
    var body: some View {
        HStack {
            Image(systemName: "plus")
            Toggle("", isOn: $signNumber)
                .labelsHidden()
            Image(systemName: "minus")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
