import SwiftUI

struct arithmetic {
  var randomNumber1 = Int.random(in: 0...9)
  var randomNumber2 = Int.random(in: 0...9)
  var randomNumber3 = Int.random(in: 0...9)
  var randomNumber4 = Int.random(in: 0...9)
  
  var userAnswer1 = ""
  var userAnswer10 = ""
  var userAnswer100 = ""
  var userAnswer1000 = ""
  
  var answerLabel = "확인"
  
  var buttonBackgroundColor: Color = Color.black
  var isButtonEnabled = false
  
  func twoDigitOperation() -> Int {
    return ((randomNumber1 * 10) + randomNumber2) * ((randomNumber3 * 10) + randomNumber4)
  }
  func userAnswer() -> Int {
    return Int(userAnswer1000 + userAnswer100 + userAnswer10 + userAnswer1) ?? 0
  }
  
  mutating func checkAnswer() -> Bool {
    let userAnswer = userAnswer()
    
    let correctAnswer = twoDigitOperation()
    
    let isCorrect = userAnswer == correctAnswer
    
    // 여기서 isButtonEnabled 값을 변경해줍니다.
    isButtonEnabled = isCorrect
    buttonBackgroundColor = isCorrect ? .green : .red
    return isCorrect
  }
  
  mutating func nextProblem() {
    randomNumber1 = Int.random(in: 0...9)
    randomNumber2 = Int.random(in: 0...9)
    randomNumber3 = Int.random(in: 0...9)
    randomNumber4 = Int.random(in: 0...9)
    userAnswer1 = ""
    userAnswer10 = ""
    userAnswer100 = ""
    userAnswer1000 = ""
    answerLabel = "문제"
    buttonBackgroundColor = .black
    isButtonEnabled = false
  }
  
  mutating func buttonCheck() {
    let isCorrect = checkAnswer()
    if isCorrect {
      answerLabel = "정답"
      buttonBackgroundColor = .green
      isButtonEnabled = true
      

    } else {
      answerLabel = "틀렸습니다."
      buttonBackgroundColor = .red
      isButtonEnabled = false
      
    }
  }
}
