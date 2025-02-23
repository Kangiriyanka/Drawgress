//
//  ModelFormType.swift
//  ImageDict
//
//  Created by Kangiriyanka The Single Leaf on 2025/02/22.
//

import SwiftUI

enum ModelFormType: Identifiable, View {
    
    case new
    case update(DrawingPrompt)
    var id: String {
        String(describing: self)
    }
    var body: some View {
        switch self {
        case .new:
            UpdateEditFormView(vm: UpdateEditFormViewModel())
        case .update(let prompt):
            UpdateEditFormView(vm: UpdateEditFormViewModel(prompt: prompt))
        }
    }
}
