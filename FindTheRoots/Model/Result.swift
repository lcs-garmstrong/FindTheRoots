//
//  Result.swift
//  FindTheRoots
//
//  Created by Graeme Armstrong on 2023-01-24.
//

import Blackbird
import Foundation


struct Result: BlackbirdModel {
    @BlackbirdColumn var givenA: String
    @BlackbirdColumn var givenB: String
    @BlackbirdColumn var givenC: String
    @BlackbirdColumn var roots1: Double
    @BlackbirdColumn var roots2: Double
}

let resultForPreview = Result(givenA: "1", givenB: "-6", givenC: "8", roots1: 2, roots2: 4)
