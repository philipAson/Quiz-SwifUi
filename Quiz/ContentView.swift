//
//  ContentView.swift
//  Quiz
//
//  Created by Philip Andersson on 2023-04-12.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var questionsVM = QuestionsViewModel()
    
    @State var score : Int = 0
    
    var body: some View {
        VStack {
            Spacer()
            Text(String(score))
            Spacer()
            Text(questionsVM.currentQuestion.question)
                .padding()
            
            ForEach(questionsVM.currentAnswers, id: \.self) { answer in
                Button(action: {
                    handleAnswer(answer: answer)
                }) {
                    Text(answer)
                }
            }
            
            Spacer()
        }
        .onAppear{
            questionsVM.nextQuestion()
        }
        .sheet(isPresented: $questionsVM.gameOver,onDismiss: {
            score = 0
            questionsVM.resetGame()
            questionsVM.nextQuestion()
        }, content: {
            GameOverSheet(score: score)})
    }
    
    func handleAnswer(answer : String) {
        // Check if correct answer
        if answer == questionsVM.currentQuestion.correctAnswer {
            print("correct")
            questionsVM.nextQuestion()
            // Add points
            score += 1
        } else {
            print("wrong answer")
            // Go to the next question
            questionsVM.nextQuestion()
        }
    }
}

struct GameOverSheet : View {
    var score : Int
    
    var body: some View {
        ZStack {
            Color(red: 38/256, green: 108/256, blue: 59/256)
                .ignoresSafeArea()
            
            VStack{
                Text("slut i rutan")
                Text("poäng: \(score)")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.title)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// quiz app

// x enkel layout för vår app
// x

// slumpa ordning på svarsalternativ
// inte samma fråga två gånger i rad
