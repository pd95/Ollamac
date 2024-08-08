//
//  AssistantMessageView.swift
//  Ollamac
//
//  Created by Kevin Hermawan on 8/2/24.
//

import Defaults
import MarkdownUI
import SwiftUI

struct AssistantMessageView: View {
    @Default(.fontSize) private var fontSize

    private let content: String?
    private let isGenerating: Bool
    
    init(content: String?, isGenerating: Bool) {
        self.content = content
        self.isGenerating = isGenerating
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Assistant")
                .font(Font.system(size: 16).weight(.semibold))
                .foregroundStyle(.accent)
            
            if let content {
                Markdown(content)
                    .textSelection(.enabled)
                    .markdownTextStyle(\.text) {
                        FontSize(CGFloat(fontSize))
                    }
                    .markdownTextStyle(\.code) {
                        FontSize(CGFloat(fontSize))
                        FontFamily(.system(.monospaced))
                    }
                    .markdownTheme(.ollamac)
                    .markdownCodeSyntaxHighlighter(.ollamac)
            } else if isGenerating {
                ProgressView()
                    .controlSize(.small)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
