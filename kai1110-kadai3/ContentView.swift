
import SwiftUI

struct ContentView: View {
    @State var textNumber1 = ""
    @State var textNumber2 = ""
    
    @State private var signedNumber1 = 0
    @State private var signedNumber2 = 0
    
    @State var signNumber1 = false
    @State var signNumber2 = false
    
    @State private var resultNumber = 0
    
    var body: some View {
        VStack(spacing: 30) {
            HStack(spacing: 30) {
                TextFieldView(textNumber: $textNumber1)
                TextFieldView(textNumber: $textNumber2)
            }
            HStack(spacing: 30) {
                ToggleView(signNumber: $signNumber1)
                ToggleView(signNumber: $signNumber2)
            }

            HStack(spacing: 30) {
                Text("\(signedNumber1)")
                Image(systemName: "plus")
                Text("\(signedNumber2)")
            }
            
            Button(action: {
                let number1 = parseNumber(number: textNumber1)
                if signNumber1 {
                    signedNumber1 = -number1
                } else {
                    signedNumber1 = number1
                }

                let number2 = parseNumber(number: textNumber2)
                if signNumber2 {
                    signedNumber2 = -number2
                } else {
                    signedNumber2 = number2
                }

                resultNumber = signedNumber1 + signedNumber2
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

struct TextFieldView: View {
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

struct ToggleView: View {
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
