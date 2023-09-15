import SwiftUI



struct ContentView: View {
  
  @State private var twoDigit = arithmetic()
  
  var body: some View {
    
    ZStack {
      Color("backgroundColor")
        .edgesIgnoringSafeArea(.all)
      
      VStack(spacing: 10) {
        
        HStack(spacing: 10) {
          Rectangle()
            .frame(width: 80, height: 80)
            .foregroundColor(.clear)
          
          Spacer()
          Rectangle()
            .frame(width: 80, height: 80)
            .overlay(
              Text("\(twoDigit.randomNumber1)")
                .font(.system(.largeTitle))
                .foregroundColor(.white)
            )
            .cornerRadius(8)
          Rectangle()
            .frame(width: 80, height: 80)
            .overlay(
              Text("\(twoDigit.randomNumber2)")
                .font(.system(.largeTitle))
                .foregroundColor(.white)
            )
            .cornerRadius(8)
          
        }
        
        
        HStack(spacing: 10) {
          
          Rectangle()
            .frame(width: 80, height: 80)
            .foregroundColor(.clear)
            .overlay(
              Image(systemName: "multiply")
                .resizable()
                .frame(width: 40, height: 40)
            )
            .offset(y: 10)
          Spacer()
          Rectangle()
            .frame(width: 80, height: 80)
            .overlay(
              Text("\(twoDigit.randomNumber3)")
                .font(.system(.largeTitle))
                .foregroundColor(.white)
            )
            .cornerRadius(8)
          Rectangle()
            .frame(width: 80, height: 80)
            .overlay(
              Text("\(twoDigit.randomNumber4)")
                .font(.system(.largeTitle))
                .foregroundColor(.white)
            )
            .cornerRadius(8)
        }
        
        
        
        Rectangle()
          .frame(width: 350, height: 5)
        
        HStack {
          NumericTextField(text: $twoDigit.userAnswer1000)
          NumericTextField(text: $twoDigit.userAnswer100)
          NumericTextField(text: $twoDigit.userAnswer10)
          NumericTextField(text: $twoDigit.userAnswer1)
        }
        
        
        
        HStack(spacing: 10) {
          Button {
            twoDigit.buttonCheck()
            if twoDigit.isButtonEnabled {
              DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                twoDigit.answerLabel = "다음문제"
              }
            } else {
              DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                twoDigit.buttonBackgroundColor = .black
                twoDigit.answerLabel = "다시 풀어봐"
              }
            }
          } label: {
            Rectangle()
              .frame(width: 170, height: 80)
              .cornerRadius(15)
              .foregroundColor(twoDigit.buttonBackgroundColor)
              .overlay(
                Text(twoDigit.answerLabel)
                  .foregroundColor(.white)
              )
            
          }
          
          
          Button {
            twoDigit.nextProblem()
          } label: {
            if twoDigit.isButtonEnabled == true {
              Rectangle()
                .frame(width: 170, height: 80)
                .cornerRadius(15)
                .foregroundColor(.black)
                .overlay(
                  Text("다음문제 >>")
                    .foregroundColor(.white)
                )
            } else {
              Rectangle()
                .frame(width: 160, height: 80)
                .cornerRadius(15)
                .foregroundColor(.clear)
                .overlay(
                  Text("")
                    .foregroundColor(.clear)
                )
            }
          }
          .disabled(!twoDigit.isButtonEnabled)
          
          
        }//: HSTACK
        .padding(.top, 40)
        .padding(.bottom, 30)
        
      }//: VSTACK
      .padding(50)
      .padding(.top, 40)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}



