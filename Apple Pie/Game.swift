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
    
    var gussedWord: String {
        var tempWord = ""
        for letter in word{
            tempWord += String(gussedLetters.contains(Character(letter.uppercased())) || letter == "-" || letter == " " ?  letter : "_")
        }
        return tempWord
    }
    
    mutating func playerGussed(letter: Character) {
        let upperLetter = Character(letter.uppercased())
        gussedLetters.append(upperLetter)
        if !word.uppercased().contains(upperLetter) {
            incorrectMoves -= 1
        }
    }
}
