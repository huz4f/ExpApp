import SwiftUI
import NaturalLanguage

struct ContentView: View {
    @State private var experienceText: String = ""
    @State private var analyzedSentiment: String = "Awaiting your experience..."
    
    private let tagger = NLTagger(tagSchemes: [.sentimentScore])
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Share Your Experience")
                .font(.title).bold()
            
            TextEditor(text: $experienceText)
                .frame(height: 150)
            
            Button(action: {
                analyzedSentiment = analyzeExperience(experienceText)
            }) {
                Text("Analyze Sentiment")}
            
            Text(analyzedSentiment)
                .font(.title2)
                .padding()}
        .padding()}
    
    private func analyzeExperience(_ inputText: String) -> String {
        tagger.string = inputText
        let sentimentScore = tagger.tag(at: inputText.startIndex, unit: .paragraph, scheme: .sentimentScore)
        
        guard let tag = sentimentScore.0, let score = Double(tag.rawValue) else {
            return "Unable to Analyze"
        }
        
        if score > 0.5 {
            return "🌟 Positive Experience!"
        } else if score < -0.5 {
            return "😕 Room for Improvement"
        } else {
            return "💬 Seems Neutral"}}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()}
}
