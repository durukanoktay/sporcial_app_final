//
//  ChatManager.swift
//  Demo
//
//  Created by Durukan Oktay on 27.12.2023.
//

import SwiftUI
struct ChatManager: View {
    
    @State private var newMessage: String = ""
    
    var chat: [ChatData] = [
        ChatData(content: "Merhaba!", sender: true),
        ChatData(content: "Ne zaman Müsaitsin?", sender: true),
        ChatData(content: "Her zaman müsaitim", sender: false),
        ChatData(content: "100.Yılda buluşalım istersen?", sender: true),
        ChatData(content: "Tamam, 11.00 gibi boş musun?", sender: false)
    ]

    
    var body: some View {
        VStack {
            List {
                ForEach(chat, id: \.content) { message in
                    MessageView(content: message.content, isSender: message.sender)
                }
            }

            HStack {
                TextField("Type a message...", text: $newMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button("Send") {
                    
                  //  (ChatData(content: newMessage, sender: true))
                    newMessage = "" // Clear the text field
                }
            }
            .padding()
        }
    }
}

struct MessageView: View {
    var content: String
    var isSender: Bool
    
    var body: some View {
        HStack {
            if isSender {
                Spacer() // Sola boşluk bırak
                Text(content)
                    .padding(10)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            } else {
                Text(content)
                    .padding(10)
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                Spacer() // Sağa boşluk bırak
            }
        }
    }
}


#Preview {
    ChatManager()
}
