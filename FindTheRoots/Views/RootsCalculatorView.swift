//
//  RootsCalculatorView.swift
//  FindTheRoots
//
//  Created by Graeme Armstrong on 2023-01-24.
//

import SwiftUI

struct RootsCalculatorView: View {
    // MARK: Stored properties
    
    @State var a: Double = 1
    @State var b: Double = 1
    @State var c: Double = 1
    
    // MARK: Computed properties
    
    var result: String {
        // is discriminant is < 0 (no answer)
        // if discriminant = 0 (1 answer)
        // if discriminant > 0 (2 answers)
        
        
        let discriminant = b * b - 4 * a * c
        
        if discriminant < 0 {
            return "No Real Roots"
        } else {
            let x1 = ( b * -1 - discriminant.squareRoot() ) / (2 * a)
            let x2 = ( b * -1 + discriminant.squareRoot() ) / (2 * a)

            return "x ≈ \(x1.formatted(.number.precision(.fractionLength(3)))) and x ≈ \(x2.formatted(.number.precision(.fractionLength(3))))"
        }
    }
    
    // MARK: User interface
    var body: some View {
        VStack {
            
            Image("Quadratic Formula")
                .resizable()
                .scaledToFit()
            
            HStack{
                VStack {
                Text("a: \(a)")
                Slider(value: $a,
                       in: -50...50,
                       step: 0.5,
                       label: {Text("a")})
            }
                 
                VStack{
                    Text("b: \(b)")
                    Slider(value: $b,
                           in: -50...50,
                           step: 0.5,
                           label: {Text("b")})
                }
                
                VStack{
                    Text("c: \(c)")
                    Slider(value: $c,
                           in: -50...50,
                           step: 0.5,
                           label: {Text("c")})
                }
            }
            
            Text("x-int")
            Text("\(result)")
            
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
