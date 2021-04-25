//
//  Game.swift
//  Apple Pie
//
//  Created by Alexwrom on 25.04.2021.
//

struct Game {
    var word : String
    var incorrectMoves : Int
    fileprivate var gussedLetters: [Character] = []
    
    init (word: String, incorrectMoves: Int){
        self.word = word
        self.incorrectMoves = incorrectMoves
    }
    
    mutating func playerGussed(letter: Character){
        let upperLetter = Character(letter.uppercased())
        gussedLetters.append(upperLetter)
        if !word.uppercased().contains(upperLetter) {
            incorrectMoves -= 1
        }
        
        if incorrectMoves == 0 {
            incorrectMoves = 7
        }
    }
}
