//
//  ContentView.swift
//  TicTacToe
//
//  Created by AMStudent on 9/15/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
        Home()
            .navigationTitle("Tic Tac Toe")
            .preferredColorScheme(.dark)
        }
    }
}

struct Home: View{
    
    //Number of moves we can make
    @State var moves: [String] = Array(repeating: "", count: 9)
    //To identify our current player
    @State var isPlaying = false
    
    var body: some View {
        VStack{
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 3), spacing: 15) {
                
                ForEach(0..<9, id: \.self) {
                    index in
                    
                    ZStack {
                        
                        Color.blue
                        
                        Color.white
                            .opacity(moves[index] == "" ? 1 : 0)
                        
                        Text(moves[index])
                            .font(.system(size:55))
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                    }
                        .frame(width: getWitdh(), height: getWitdh())
                        .cornerRadius(15)
                    
                    .onTapGesture(perform: {
                        withAnimation(Animation.easeIn(duration: 0.5)) {
                            
                        if moves [index] == "" {
                            moves[index] = isPlaying ? "X" : "O"
                            isPlaying.toggle()
                            }
                            
                        }
                    })
                }
             }
            
            .padding(15)
        }
    }
    
    //Calculate width of grid
    func getWitdh() -> CGFloat {
        let witdh = UIScreen.main.bounds.width - (30 + 30)
        
        return witdh / 3
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
