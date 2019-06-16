//  Created by Martin Mitrevski on 15.06.19.

import Vision
import SwiftUI
import Combine

public struct TextRecognizer {
    
    @Binding var recognizedText: String
    
    private let textRecognitionWorkQueue = DispatchQueue(label: "TextRecognitionQueue",
                                                         qos: .userInitiated, attributes: [], autoreleaseFrequency: .workItem)
    
    func recognizeText(from images: [CGImage]) {
        self.recognizedText = ""
        var tmp = ""
        let textRecognitionRequest = VNRecognizeTextRequest { (request, error) in
            guard let observations = request.results as? [VNRecognizedTextObservation] else {
                print("The observations are of an unexpected type.")
                return
            }
            // Concatenate the recognised text from all the observations.
            let maximumCandidates = 1
            for observation in observations {
                guard let candidate = observation.topCandidates(maximumCandidates).first else { continue }
                tmp += candidate.string + "\n"
            }
        }
        textRecognitionRequest.recognitionLevel = .accurate
        for image in images {
            let requestHandler = VNImageRequestHandler(cgImage: image, options: [:])
            
            do {
                try requestHandler.perform([textRecognitionRequest])
            } catch {
                print(error)
            }
            tmp += "\n\n"
        }
        self.recognizedText = tmp
    }
    
}
