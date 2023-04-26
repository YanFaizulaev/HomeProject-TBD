//
//  ChatViewController.swift
//  HomeProject-TBD
//
//  Created by Bandit on 25.04.2023.
//

import UIKit
import MessageKit
import MessageInputBar
import InputBarAccessoryView

class ChatViewController: MessagesViewController, InputBarAccessoryViewDelegate {
    
    var messages = [Message]()
    
    var currentUser = Sender(senderId: "self", displayName: "Slava")
    let otherUser = Sender(senderId: "other", displayName: "Nika")
    
    var file: ChatTableViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setChat()
        
        view.backgroundColor = .white
        title = file?.labelNameChat
        
        let image = UIImage(systemName: "doc.text.magnifyingglass")
        //        let image = file?.labelImage.withTintColor(.white)
        let resizedImage = image?.resizeImage(targetSize: CGSize(width: 40, height: 40))
        let button = UIBarButtonItem(image: resizedImage, style: .plain, target: self, action: #selector(rightBarButton))
        button.image?.withRenderingMode(.alwaysOriginal)
        navigationItem.rightBarButtonItem = button
    }
    
    @objc func rightBarButton() {
        print("Информация про чат")
//        let vc = InfoChatViewController()
//        vc.modalPresentationStyle = .fullScreen
//        vc.modalTransitionStyle = .crossDissolve
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setChat () {
        // message
        messages.append(Message(messageId: "1",
                                sender: currentSender,
                                sentDate: Date().addingTimeInterval(-2000),
                                kind: .text("Привет")))
        messages.append(Message(messageId: "2",
                                sender: otherUser,
                                sentDate: Date().addingTimeInterval(-1000),
                                kind: .text("Привет")))
        messages.append(Message(messageId: "3",
                                sender: currentSender,
                                sentDate: Date(),
                                kind: .text("Выйдешь завтра на смену?")))
        
        // Set up message input bar
        messageInputBar.delegate = self
        messageInputBar.sendButton.setTitleColor(.blue, for: .normal)
        
        // Set up messages collection view
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
    }
}

extension ChatViewController: MessagesDataSource {
    
    var currentSender: MessageKit.SenderType {
        return currentUser
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        if messages.count == 0 {
            print("No messages to display")
            return 0
        } else {
            return messages.count
        }
    }
    
}

extension ChatViewController: MessagesLayoutDelegate {
    func heightForLocation(message: MessageType, at indexPath: IndexPath, with maxWidth: CGFloat, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 50
    }
}

extension ChatViewController: MessagesDisplayDelegate {
    func backgroundColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
            return isFromCurrentSender(message: message) ? .blue: .lightGray
        }
    
    func messageStyle(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageStyle {
        let corner: MessageStyle.TailCorner = isFromCurrentSender(message: message) ? .bottomRight : .bottomLeft
        return .bubbleTail(corner, .curved)
    }
}

extension ChatViewController: MessageInputBarDelegate {
    func messageInputBar(_ inputBar: MessageInputBar, didPressSendButtonWith text: String) {
        let message = Message(messageId: "\(messages.count + 1)",
                              sender: currentSender,
                              sentDate: Date(),
                              kind: .text(text))
        messages.append(message)
        messagesCollectionView.reloadData()
        messagesCollectionView.scrollToLastItem(animated: true)
        inputBar.inputTextView.text = ""
    }
}

