//
//  Notes.swift
//  Notes Watch App
//
//  Created by erge on 5.02.2023.
//

import SwiftUI

struct Notes: View {
    //MARK: - PROPERTY
    @State private var notes: [Note]  = [Note]()
    @State private var text: String = ""
    
    
    //MARK: BODY
    var body: some View {
        VStack {
            HStack(spacing: 6) {
                TextField("Add New Note", text: $text)
                
                Button {
                    print("Button Click")
                    guard text.isEmpty == false else { return }
                    let note = Note(id: UUID(), text: text)
                    notes.append(note)
                    text = ""
                    save()
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 42,weight: .semibold))
                }
                .fixedSize()
                .buttonStyle(.plain)
                .foregroundColor(.accentColor)
            }//MARK: HSTACK
            Spacer()
            Text("\(notes.count)")
        }//MARK: - VSTACK
        .navigationTitle("Notes")
    }
    
    //MARK: - FUNCTION
    
    func save(){
        dump(notes)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Notes()
    }
}
