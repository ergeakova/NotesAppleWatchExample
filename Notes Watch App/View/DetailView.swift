//
//  DetailView.swift
//  Notes Watch App
//
//  Created by erge on 7.02.2023.
//

import SwiftUI

struct DetailView: View {
    //MARK: - PROPERTY
    let note: Note
    let count: Int
    let index: Int
    @State private var isCreditsPresented = false
    @State private var isSettingsPresented = false
    
    //MARK: - BODY
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            
            // HEADER
            HeaderView()
            
            Spacer()
            
            ScrollView(.vertical){
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            Spacer()
            // FOOTER
            HStack(alignment: .center){
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        isSettingsPresented.toggle()
                    }
                
                Spacer()
                Text("\(count) / \(index + 1)")
                Spacer()
                
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreditsPresented.toggle()
                    }
                    .sheet(isPresented: $isCreditsPresented, content: {
                        CreditsView()
                    })
                    .sheet(isPresented: $isSettingsPresented, content: {
                        SettingsView()
                    })
            }
            .foregroundColor(.secondary)
        }
    }
}
