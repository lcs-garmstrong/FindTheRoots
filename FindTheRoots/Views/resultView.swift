//
//  ResultView.swift
//  FindTheRoots
//
//  Created by Graeme Armstrong on 2023-01-24.
//

import SwiftUI

struct ResultView: View {
    
    // allows "result" data to be shown 
    let somePriorResult: Result
    
    var body: some View {
        
        VStack (spacing: 10) {
            HStack (spacing: 40){
                VStack {
                    Text(somePriorResult.givenA)
            }
                 
                VStack{
                    Text(somePriorResult.givenB)
                }
                
                VStack{
                    Text(somePriorResult.givenC)
                }
            }
            
            Text("X-Int: \(somePriorResult.roots1.formatted(.number.precision(.fractionLength(3))))")
            Text("X-Int: \(somePriorResult.roots2.formatted(.number.precision(.fractionLength(3))))")
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(somePriorResult: resultForPreview)
    }
}
