//
//  QuestionsViewModel.swift
//  Quiz
//
//  Created by Philip Andersson on 2023-04-12.
//

import Foundation

class QuestionsViewModel : ObservableObject {
    
    @Published var gameOver = false
    
    let initialQuestions = [
        Question(question: "När är julafton", correctAnswer: "24 Dec", incorrectAnswers: ["1 Jan", "6 Maj", "9 Dec"]),
        Question(question: "hur högt är Eifeltornet?", correctAnswer: "324 meter", incorrectAnswers: ["100 meter", "200 meter", "500 meter"]),
        Question(question: "hur stor är sveriges befolkning", correctAnswer: "ca 10 miljoner", incorrectAnswers: ["ca 8.5 miljoner", "ca 9 miljoner", "ca 11 miljoner"]),
        Question(question: "Vad heter den största staden i Sverige?", correctAnswer: "Stockholm", incorrectAnswers: ["Göteborg", "Malmö", "Uppsala"]),
        Question(question: "Vad heter den högsta byggnaden i världen?", correctAnswer: "Burj Khalifa", incorrectAnswers: ["Empire State Building", "Eiffeltornet", "Shanghai Tower"]),
        Question(question: "Vem var USA:s första president?", correctAnswer: "George Washington", incorrectAnswers: ["Thomas Jefferson", "John Adams", "James Madison"]),
        Question(question: "Vad kallas det när solen är helt täckt av månen?", correctAnswer: "Total solförmörkelse", incorrectAnswers: ["Total månförmörkelse", "Halv solförmörkelse", "Halv månförmörkelse"]),
        Question(question: "Vad heter den första boken i 'Harry Potter'-serien?", correctAnswer: "Harry Potter och De vises sten", incorrectAnswers: ["Harry Potter och Hemligheternas kammare", "Harry Potter och Fången från Azkaban", "Harry Potter och den Flammande Bägaren"]),
        Question(question: "Vilket land är känt för att ha skapat origami?", correctAnswer: "Japan", incorrectAnswers: ["Kina", "Korea", "Thailand"]),
        Question(question: "Vem är känd för att ha målat 'Mona Lisa'?", correctAnswer: "Leonardo da Vinci", incorrectAnswers: ["Vincent van Gogh", "Pablo Picasso", "Rembrandt van Rijn"]),
        Question(question: "Vilket land vann fotbolls-VM 2018?", correctAnswer: "Frankrike", incorrectAnswers: ["Kroatien", "Sverige", "Belgien"]),
        Question(question: "Vad heter huvudstaden i Danmark?", correctAnswer: "Köpenhamn", incorrectAnswers: ["Stockholm", "Oslo", "Helsingfors"]),
        Question(question: "Vilket land är känt för att ha byggt Colosseum?", correctAnswer: "Rom", incorrectAnswers: ["Grekland", "Egypten", "Kina"]),
        Question(question: "Vad heter den största kontinenten i världen?", correctAnswer: "Asien", incorrectAnswers: ["Afrika", "Europa", "Australien"]),
        Question(question: "Vem skrev boken 'Alice i underlandet'?", correctAnswer: "Lewis Carroll", incorrectAnswers: ["J.K. Rowling", "Charles Dickens", "Jane Austen"]),
        Question(question: "Vad heter den första boken i 'The Hunger Games'-serien?", correctAnswer: "Hungerspelen", incorrectAnswers: ["Fatta eld", "Revolt", "Sanning"]),
        Question(question: "Vad heter världens största ö?", correctAnswer: "Grönland", incorrectAnswers: ["Australien", "Madagaskar", "Island"]),
        Question(question: "Vad kallas den största religiösa byggnaden i världen?", correctAnswer: "Mecka", incorrectAnswers: ["Vatikanen", "Jerusalem", "Tibet"]),
        Question(question: "Vilken färg har en banan?", correctAnswer: "Gul", incorrectAnswers: ["Grön", "Röd", "Blå"]),
        Question(question: "Vad heter huvudstaden i Sverige?", correctAnswer: "Stockholm", incorrectAnswers: ["Göteborg", "Malmö", "Uppsala"]),
        Question(question: "Vad kallas hunden som vaktar får?", correctAnswer: "Vallhund", incorrectAnswers: ["Jakthund", "Terrier", "Boxer"]),
        Question(question: "Vad heter planeten som är närmast solen?", correctAnswer: "Merkurius", incorrectAnswers: ["Venus", "Mars", "Jupiter"]),
        Question(question: "Vem var den första människan i rymden?", correctAnswer: "Jurij Gagarin", incorrectAnswers: ["Neil Armstrong", "Buzz Aldrin", "Sally Ride"]),
        Question(question: "Vad är världens högsta berg?", correctAnswer: "Mount Everest", incorrectAnswers: ["Kilimanjaro", "Aconcagua", "Denali"]),
        Question(question: "Vad kallas den högsta domstolen i Sverige?", correctAnswer: "Högsta domstolen", incorrectAnswers: ["Högsta förvaltningsdomstolen", "Hovrätten", "Tingsrätten"]),
        Question(question: "Vem skrev boken 'Mio min Mio'?", correctAnswer: "Astrid Lindgren", incorrectAnswers: ["Roald Dahl", "Enid Blyton", "Tove Jansson"]),
        Question(question: "Vilket land är känt för att ha byggt pyramiderna?", correctAnswer: "Egypten", incorrectAnswers: ["Kina", "Grekland", "Rom"]),
        Question(question: "Vad heter den största sjön i Sverige?", correctAnswer: "Vänern", incorrectAnswers: ["Mälaren", "Vättern", "Hjälmaren"])
    ]
    
    var questions : [Question] = []
    
    @Published var currentQuestion : Question
    
    var currentAnswers : [String] = []

    init() {
        questions = initialQuestions
        let rand = Int.random(in: 0..<questions.count)
        currentQuestion = questions[rand]
    }
    
    func createAnswers() {
        let answers = ([currentQuestion.correctAnswer] + currentQuestion.incorrectAnswers).shuffled()
        currentAnswers = answers
    }
    
    func nextQuestion() {
        if questions.isEmpty {
            // !!!GAME OVER!!!
            gameOver = true
            
            
        } else {
            // ställ ny fråga
            let rand = Int.random(in: 0..<questions.count)
            currentQuestion = questions[rand]
            createAnswers()
            questions.remove(at: rand)
        }
        
    }
    func firstQuestion() {
        let rand = Int.random(in: 0..<questions.count)
        currentQuestion = questions[rand]

    }
    
    func resetGame() {
        questions = initialQuestions
    }
}
