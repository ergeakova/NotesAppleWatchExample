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
    
    //MARK: - BODY
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            
            // HEADER
            HStack{
                Capsule()
                    .frame(height: 1)
                
                Image(systemName: "note.text")
                
                Capsule()
                    .frame(height: 1)
            } // HSTACK
            .foregroundColor(.accentColor)
            
            Spacer()
            
            ScrollView(.vertical){
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                
            Spacer()
                
                // FOOTER
                HStack(alignment: .center){
                    Image(systemName: "gear")
                        .imageScale(.large)
                    Spacer()
                    Text("\(count) / \(index)")
                    Spacer()
                    Image(systemName: "info.circle")
                        .imageScale(.large)
                }
                .foregroundColor(.secondary)
            }
        }
    }
}
