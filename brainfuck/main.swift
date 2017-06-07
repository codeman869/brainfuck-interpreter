//
//  main.swift
//  brainfuck
//
//  Created by CODY DECKARD on 6/6/17.
//  Copyright © 2017 CODY DECKARD. All rights reserved.
//

import Foundation

public class BFInterpreter {
    
    var memory = Array(repeating: 0, count: 30000)
    var codePointer = 0
    var memPointer = 0
    
    public func run(_ code: String) -> String {
        var output : [Int] = []
        let codeArray = Array(code.characters)

        while self.codePointer >= 0 && self.codePointer < codeArray.count {
            switch codeArray[codePointer] {
            case ">":
                self.memPointer += 1
            case "<":
                self.memPointer -= 1
            case "+":
                self.memory[memPointer] = (self.memory[memPointer] + 1) % 256
            case "-":
                self.memory[memPointer] = (self.memory[memPointer] - 1) % 256
            case ".":
                output.append(memory[memPointer])
            case "[":
                break
            case "]":
                break
            default:
                break
            }
        
            if memPointer < 0 || memPointer >= memory.count {
                break
            }
        }
    
        return output.reduce("") { return $0 + "\(UnicodeScalar($1)!)"}
    }
}
