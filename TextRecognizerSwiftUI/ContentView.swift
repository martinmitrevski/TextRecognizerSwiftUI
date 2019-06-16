//
//  ContentView.swift
//  TextRecognizerSwiftUI
//
//  Created by Martin Mitrevski on 16.06.19.
//  Copyright © 2019 Mitrevski. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @ObjectBinding var recognizedText: RecognizedText = RecognizedText()
    
    var body: some View {
        NavigationView {
            VStack {
                Text(recognizedText.value)
                .lineLimit(nil)
                Spacer()
                NavigationButton(destination: ScanningView(recognizedText: $recognizedText.value)) {
                    Text("Scan document")
                }
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
