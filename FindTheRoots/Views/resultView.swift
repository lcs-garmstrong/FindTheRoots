//
//  ResultView.swift
//  FindTheRoots
//
//  Created by Graeme Armstrong on 2023-01-24.
//

import SwiftUI

struct ResultView: View {
    
    let somePriorResult: Result
    
    var body: some View {
        VStack (spacing: 10) {
            HStack (spacing: 40){
                VStack {
                    Text("b: \(somePriorResult.a.formatted(.number.precision(.fractionLength(3))))")
            }
                 
                VStack{
                    Text("a: \(somePriorResult.b.formatted(.number.precision(.fractionLength(3))))")
                }
                
                VStack{
                    Text("c:\(somePriorResult.c.formatted(.number.precision(.fractionLength(3))))")
                }
            }
            
            Text(somePriorResult.roots)
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(somePriorResult: resultForPreview)
    }
}
