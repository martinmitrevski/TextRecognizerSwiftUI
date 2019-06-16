//  Created by Martin Mitrevski on 16.06.19.
//  Copyright © 2019 Mitrevski. All rights reserved.
//

import Combine
import SwiftUI

final class RecognizedText: BindableObject {
    
    let didChange = PassthroughSubject<RecognizedText, Never>()
    
    var value: String = "Scan document to see its contents" {
        didSet {
            didChange.send(self)
        }
    }
    
}
