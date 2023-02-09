//
//  SettingsView.swift
//  Notes Watch App
//
//  Created by erge on 9.02.2023.
//

import SwiftUI

struct SettingsView: View {
    //MARK: - PROPERTY
    @AppStorage("lineCount") var lineCount: Int = 1
    @State private var value: Float = 1.0
    
    func update(){
        lineCount = Int(value)
    }
    
    //MARK: - BODY
    var body: some View {
        VStack(spacing: 8) {
            HeaderView(title: "Settings")
            
            Text("Lines: \(lineCount)".uppercased())
                .fontWeight(.bold)
            
            Slider(value: Binding(get: {
                Float(self.lineCount)
            }, set: { newValue in
                self.value = newValue
                self.update()
            }), in: 1...4, step: 1)
                .accentColor(.accentColor)
        }// VSTACK
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
