//
//  ContentView.swift
//  IflagChoice
//
//  Created by Ricardo Roman Landeros on 02/04/21.
//

import SwiftUI


struct ContentView: View {
    
    @State private var mostrarRecord = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland",
                     "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    
    var body: some View {
        ZStack {
            //Color.blue.edgesIgnoringSafeArea(.all)
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0..<3) { number in
                    Button(action: {
                        self.banderaPrecionada(number)
                    }, label: {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                            .shadow(color: .black, radius: 2)
                    })
                }
                Text("Su record es \(score) respuestas correctas")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .multilineTextAlignment(.center)
            
                Spacer()
            }
        }//fin de Zstack
        .alert(isPresented: $mostrarRecord) {
            Alert(title: Text(scoreTitle), message: Text("Tu record es \(score)?"), dismissButton: .default(Text("Continue")){
                self.askQuestion()
            })
        }
        
        
        
    }
    
    func banderaPrecionada(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
           scoreTitle = "Incorrecto es la bandera de \(countries[number])"
           score -= 1
        }
        
        mostrarRecord = true
    }
    
    func askQuestion() {
        countries.shuffled()
        correctAnswer = Int.random(in: 0...2)
    }
    
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
