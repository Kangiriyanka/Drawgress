//
//  PromptsView.swift
//  Drawgress
//
//  Created by Kangiriyanka The Single Leaf on 2025/10/02.
//

import SwiftUI

struct PromptsView: View {
    
    var prompts: [DrawingPrompt]
    var body: some View {
        List(prompts) { prompt in
            Text(prompt.title)
        }
    }
}

