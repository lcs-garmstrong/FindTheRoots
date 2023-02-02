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
    }
    
    var finalResult2: String {
        guard let unwrappedResult2 = result2 else {
            return "No real roots."
        }
    }
    
    var finalResult3: Double {
        let unwrappedResult3 = result1
    }
    
    var finalResult4: Double {
        let unwrappedResult4 = result2
    }
    //    return "x ≈ \(x1.formatted(.number.precision(.fractionLength(3)))) and x ≈ \(x2.formatted(.number.precision(.fractionLength(3))))"
    
    // MARK: User interface
    var body: some View {
        VStack(spacing: 20) {
            
            Image("Quadratic Formula")
                .resizable()
                .scaledToFit()
            
            Group{
                Text("A Value")
                TextField("Enter numericle value for A...", text: $givenA)
                
                
                Text("B Value")
                TextField("Enter numericle value for B...", text: $givenB)
                
                
                Text("C Value")
                TextField("Enter numericle value for C...", text: $givenC)
            }
            
            Group {
                Text("x-int")
                Text("\(finalResult1)")
                Text("\(finalResult2)")
            }
            // Button
            
            Button(action: {
                let latestResult = Result(givenA: givenA,
                                          givenB: givenB,
                                          givenC: givenC,
                                          roots1: finalResult3,
                                          roots2: finalResult4)
                priorResults.append(latestResult)
            }, label: {
                Text("Save Results")
            })
            .buttonStyle(.bordered)
            .padding()
            
            // History
            Text("History:")
                .font(.largeTitle)
            
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
