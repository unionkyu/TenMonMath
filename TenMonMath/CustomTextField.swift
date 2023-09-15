

import SwiftUI

struct TextFieldModifier: TextFieldStyle {
  
  func _body(configuration: TextField<Self._Label>) -> some View {
    ZStack {
      Rectangle()
        .foregroundColor(.white)
        .cornerRadius(8)
        .frame(width: 80, height: 80)
        .border(.indigo)
      // 텍스트필드
      configuration
        .font(.largeTitle)
        .foregroundColor(.black)
        .padding(.horizontal, 30)
    }
  }
}

struct NumericTextField: View {
  @Binding var text: String
  
  var body: some View {
    TextField("", text: $text, onEditingChanged: { isEditing in
      if !isEditing {
        self.text = self.text.filter { $0.isNumber }
      }
    })
    .keyboardType(.numberPad)
    .textFieldStyle(TextFieldModifier())
    .onChange(of: text) { newValue in
      if newValue.count > 1 {
        text = String(newValue.prefix(1))
      }
    }
  }
}





