//
//  ContentView.swift
//  SwiftChallenges
//
//  Created by Omid Shojaeian Zanjani on 05/06/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var textInput:String = ""
    @State var isUnique:Bool = true
    
    
    @State var textInput2:String = ""
    @State var isPalindrome:Bool = true
    
    @State var textInput3:String = ""
    @State var textInput4:String = ""
    @State var hasSameCharacters:Bool = false
    
    @State var textInput_story:String = ""
    @State var textInputContainer:String = ""
    
    
    var body: some View {
        Form{
            Section(header: Text("Challenge 1) Are the letters unique?")){
                
                TextField("Write your text here", text: $textInput)
                    .onChange(of: textInput) { oldValue, newValue in
                        if hasUniqueCharacters(textInput){
                            isUnique = true
                        }else {
                            isUnique = false
                        }
                    }
                Text("Status of being unique is: \(isUnique)")
            }
            
            Section(header: Text("Challenge 2)  Is a string a palindrome?")){
                TextField("write your text here", text: $textInput2)
                    .onChange(of: textInput2) { oldValue, newValue in
                        if isPalindrome(newValue) {
                            isPalindrome = true
                        }else{
                            isPalindrome = false
                        }
                    }
                Text("is palindrome: \(isPalindrome)")
            }
            
            Section(header: Text("Challenge 3) Do two strings contain the same characters?")) {
                TextField("write your first text here", text: $textInput3)
                TextField("write your second text here", text: $textInput4)
                Text("The compare result is: \(hasSameCharacters)")
            }
            .onChange(of: textInput4) { oldValue, newValue in
                if containSameCharacters(textInput3, textInput4) {
                    hasSameCharacters = true
                }else{
                    hasSameCharacters = false
                }
            }
            
            Section(header: Text("Challenge 4: Does one string contain another?")) {
                TextField("type your story text!", text: $textInput_story)
                TextField("type your keyword to search!", text: $textInputContainer)
                Text("Does it contain? \(textInput_story.fuzzyContains(textInputContainer))")
            }
        }
    }
    
    // challenge 1
    func hasUniqueCharacters(_ input: String) -> Bool {
        var usedLetters = [Character]()
          for letter in input {
             if usedLetters.contains(letter) {
                return false
             }
             usedLetters.append(letter)
          }
       return true
    }
    
    // challenge 2
    func isPalindrome(_ input: String) -> Bool {
        // Convert the string to lowercase to ignore case
        let lowercasedInput = input.lowercased()
        
        // Reverse the string
        let reversedInput = String(lowercasedInput.reversed())
        
        // Check if the original string is equal to the reversed string
        return lowercasedInput == reversedInput
    }
    // challenge 3
    func containSameCharacters(_ first: String, _ second: String) -> Bool {
        // Check if the lengths are the same; if not, they can't contain the same characters
        if first.count != second.count {
            return false
        }
        
        // Convert both strings to arrays of characters
        let firstArray = Array(first)
        let secondArray = Array(second)
        
        // Sort both arrays
        let sortedFirstArray = firstArray.sorted()
        let sortedSecondArray = secondArray.sorted()
        
        // Compare the sorted arrays
        return sortedFirstArray == sortedSecondArray
    }
    
    
}

extension String{
    // challenge 4
    func fuzzyContains(_ string:String) -> Bool {
        return self.uppercased().range(of: string.uppercased()) != nil
    }
}
#Preview {
    ContentView()
}
