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
    @AppStorage("lineCount") var lineCount: Int = 1
    
    //MARK: BODY
    var body: some View {
        NavigationView{
            VStack {
                HStack(spacing: 6) {
                    TextField("Add New Note", text: $text)
                    
                    Button {
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
                } // HSTACK
                Spacer()
                
                if notes.count >= 1 {
                    List {
                        ForEach(0..<notes.count, id: \.self) { i in
                            NavigationLink {
                                DetailView(note: notes[i], count: notes.count, index: i)
                            } label: {
                                HStack{
                                    Capsule()
                                        .frame(width: 4)
                                        .foregroundColor(.accentColor)
                                    Text(notes[i].text)
                                        .lineLimit(lineCount)
                                        .padding(.leading, 5)
                                } // HSTACK
                            } // NAVIGATION
                        } // LOOP
                        .onDelete(perform: delete)
                    }// LIST
                } else {
                    Spacer()
                    Image(systemName: "note.text")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.gray)
                        .opacity(0.25)
                        .padding(25)
                    Spacer()
                }
                
            } // VSTACK
            .navigationTitle("Notes")
            .onAppear {
                load()
            }
        }
    }
    
    //MARK: - FUNCTIONS
    
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func save(){
        do {
            let data = try JSONEncoder().encode(notes)
            let url = getDocumentDirectory().appendingPathComponent("notes")
            try data.write(to: url)
        } catch {
            print("Saving data has failed!")
        }
    }
    
    func load() {
        DispatchQueue.main.async {
            do {
                let url = getDocumentDirectory().appendingPathComponent("notes")
                let data = try Data(contentsOf: url)
                notes = try JSONDecoder().decode([Note].self, from: data)
            } catch {
                print("loading data has failed!")
            }
        }
    }
    
    func delete(offsets: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offsets)
            save()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Notes()
    }
}
