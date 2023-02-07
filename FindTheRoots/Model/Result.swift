//
//  Result.swift
//  FindTheRoots
//
//  Created by Graeme Armstrong on 2023-01-24.
//

import Foundation


struct Result: Identifiable {
    let id = UUID()
    
    let givenA: String
    let givenB: String
    let givenC: String
    let roots1: Double
    let roots2: Double
}

let resultForPreview = Result(givenA: "1", givenB: "-6", givenC: "8", roots1: 2, roots2: 4)
