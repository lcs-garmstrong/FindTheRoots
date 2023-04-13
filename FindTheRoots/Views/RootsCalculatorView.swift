//
//  RootsCalculatorView.swift
//  FindTheRoots
//
//  Created by Graeme Armstrong on 2023-01-24.
//

import SwiftUI

struct RootsCalculatorView: View {
    // MARK: Stored properties
    
    @State var givenA = ""
    @State var givenB = ""
    @State var givenC = ""
    
    // list of prior results
    @State var priorResults: [Result] = []
    
    // MARK: Computed properties
    
    var discriminant: Double? {
        // is discriminant is < 0 (no answer)
        // if discriminant = 0 (1 answer)
        // if discriminant > 0 (2 answers)
        guard let a = Double(givenA) else {
            return nil
        }
        guard let b = Double(givenB) else {
            return nil
        }
        guard let c = Double(givenC) else {
            return nil
        }
        return b * b - 4 * a * c
    }
    
    var result1: Double? {
        guard let a = Double(givenA) else {
            return nil
        }
        guard let b = Double(givenB) else {
            return nil
        }
        
        guard let unwrappedDisciminant = discriminant else {
            return nil
        }
        
        if unwrappedDisciminant < 0 {
            return nil
        } else {
            return ( b * -1 - unwrappedDisciminant.squareRoot() ) / (2 * a)
        }
    }
    
    var result2: Double? {
        guard let a = Double(givenA) else {
            return nil
        }
        guard let b = Double(givenB) else {
            return nil
        }
        
        guard let unwrappedDisciminant = discriminant else {
            return nil
        }
        
        if unwrappedDisciminant < 0 {
            return nil
        } else {
            return ( b * -1 + unwrappedDisciminant.squareRoot() ) / (2 * a)
        }
    }
    
    var finalResult1: String {
        guard let unwrappedResult1 = result1 else {
            return "No real roots."
        }
        return "\(unwrappedResult1)"
    }
    
    var finalResult2: String {
        guard let unwrappedResult2 = result2 else {
            return "No real roots."
        }
        return "\(unwrappedResult2)"
    }
    
    var historyResult1: Double? {
        guard let unwrappedResult3 = result1 else {
            return nil
        }
        return unwrappedResult3
    }
    
    var historyResult2: Double? {
        guard let unwrappedResult4 = result2 else {
            return nil
        }
        return unwrappedResult4
    }
    
    // history results as double not optional
    var unwrappedHistoryResult1: Double {
        guard let unwrappedHistoryt1 = result1 else {
            return 0
        }
        return unwrappedHistoryt1
    }
    
    var unwrappedHistoryResult2: Double {
        guard let unwrappedHistoryt2 = result2 else {
            return 0
        }
        return unwrappedHistoryt2
    }
    
    // MARK: User interface
    var body: some View {
        VStack(spacing: 20) {
            
            Image("Quadratic Formula")
                .resizable()
                .scaledToFit()
            
            Group{
                HStack(spacing: 100) {
                    Text("A Value:")
                        .bold()
                    TextField("Enter A value...", text: $givenA)
                }
                
                HStack(spacing: 100) {
                    Text("B Value:")
                        .bold()
                    TextField("Enter B value...", text: $givenB)
                }
                
                HStack(spacing: 100) {
                    Text("C Value:")
                        .bold()
                    TextField("Enter C value...", text: $givenC)
                }
            }
            
            Spacer()
            
            Group {
                Text("X-Ints:")
                    .bold()
                Text(finalResult1)
                Text(finalResult2)
            }
            
            
            // Button
            Button(action: {
                let latestResult = Result(givenA: givenA,
                                          givenB: givenB,
                                          givenC: givenC,
                                          roots1: unwrappedHistoryResult1,
                                          roots2: unwrappedHistoryResult2)
                priorResults.append(latestResult)
            }, label: {
                Text("Save Results")
            })
            .buttonStyle(.bordered)
            .padding()
            
            // History
            Text("History:")
                .font(.title2)
            
            List(priorResults.reversed()) { currentResult in
                HStack {
                    Spacer()
                    ResultView(somePriorResult: currentResult)
                }
            }
            Spacer()
            
        }
        .navigationTitle("Quadratic Formula")
        .padding()
        
    }
}

struct RootsCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RootsCalculatorView()
        }
    }
}
