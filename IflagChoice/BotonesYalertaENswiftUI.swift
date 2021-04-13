//
//  BotonesYalertaENswiftUI.swift
//  IflagChoice
//
//  Created by Ricardo Roman Landeros on 08/04/21.
//

import SwiftUI

struct BotonesYalertaENswiftUI: View {
    
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            Button("Tap Me!") {
                print("Button was tapped")
                self.showingAlert = true
            }
            
            
            Button(action: {
                print("Nuevo hola mundo")
            }, label: {
                HStack {
                    Image(systemName: "pencil")
                    Text("Edit")
                }
                    
            })
            
            .alert(isPresented: $showingAlert, content: {
                Alert(title: Text("Hello SwiftUi"), message: Text("Este es el detalle del mensaje"), dismissButton: .default(Text("OK")))
            })
        }
    }
}

struct BotonesYalertaENswiftUI_Previews: PreviewProvider {
    static var previews: some View {
        BotonesYalertaENswiftUI()
    }
}
