//
//  Note.swift
//  Notes Watch App
//
//  Created by erge on 5.02.2023.
//

import Foundation


struct Note: Identifiable, Codable {
    let id: UUID
    let text: String
}
