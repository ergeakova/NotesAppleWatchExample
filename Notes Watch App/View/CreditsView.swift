//
//  CreditsView.swift
//  Notes Watch App
//
//  Created by erge on 8.02.2023.
//

import SwiftUI

struct CreditsView: View {
    //MARK: - BODY
    var body: some View {
        VStack(spacing: 3) {
            HeaderView(title: "Credits")
            Image("developer-no1")
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
            
            Text("Erge AKOVA")
                .foregroundColor(.primary)
                .fontWeight(.bold)
            
            Text("Developer")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)
        } // VSATACK
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
