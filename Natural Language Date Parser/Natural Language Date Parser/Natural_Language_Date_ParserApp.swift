//
//  Natural_Language_Date_ParserApp.swift
//  Natural Language Date Parser
//
//  Created by Zac Cohan on 26/3/2023.
//

import SwiftUI

@main
struct Natural_Language_Date_ParserApp: App {
    var body: some Scene {
        
#if os(macOS)
        let contentView = ContentView()
            .frame(minWidth: 760.0, minHeight: 440.0) // Set the default window size here
#else
        let contentView = ContentView()
#endif
        
        
        WindowGroup {
            contentView
        }
    }
}
