//
//  ChatViewModel.swift
//  HomeProject-TBD
//
//  Created by Bandit on 26.04.2023.
//

import UIKit
import MessageKit

struct Sender: SenderType {
    var senderId: String
    var displayName: String
}

struct Message: MessageType {
    var messageId: String
    var sender: SenderType
    var sentDate: Date
    var kind: MessageKind
}
