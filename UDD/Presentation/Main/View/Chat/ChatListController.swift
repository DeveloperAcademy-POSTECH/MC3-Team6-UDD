//
//  ChatListController.swift
//  UDD
//
//  Created by jiin on 2022/07/24.
//

import UIKit

class ChatCell: UITableViewCell {
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
}

struct RecentMessage {
    let senderName: String! // 보낸사람 강아지 이름
    let senderImage: UIImage // 보낸사람 프로필 사진
    var messageContext: String
    var messageTime: Date
}

class ChatListController: UIViewController, UITableViewDataSource, UITableViewDelegate, ChatRoomVCDelegate {

    var lastChat: String?
    var lastTime: Date?
    var cellIndex = 0

    @IBOutlet weak var chatTable: UITableView!
    func getChatTime (date: Date) -> String {
        let time = DateFormatter()
        time.dateFormat = "HH:mm"
        let chatTimeString = time.string(from: date)
        return chatTimeString
    }
    var messageList = [RecentMessage]()

    func addList() {
        messageList.append(
            RecentMessage(senderName: "똘이",
                          senderImage: UIImage(systemName: "doc.fill")!, // 이거 ! 가 아니라 다른걸로 해줄거임..!
                          messageContext: "미친 척이라 말해 what's the loss to me? Ya",
                          messageTime: Date())
        )
        messageList.append(
            RecentMessage(senderName: "짱아",
                          senderImage: UIImage(systemName: "doc.fill")!, // 이거 ! 가 아니라 다른걸로 해줄거임..!
                          messageContext: "사랑 그깟 거 따위 내 눈에 눈물 한 방울 어림없지지지지지 베이비베이비베이비비에비",
                          messageTime: Date())
        )
        messageList.append(
            RecentMessage(senderName: "어쩌구저쩌구",
                          senderImage: UIImage(systemName: "doc.fill")!, // 이거 ! 가 아니라 다른걸로 해줄거임..!
                          messageContext: "사정없이 씹으라고 you're lost to me ya",
                          messageTime: Date())
        )
        messageList.append(
            RecentMessage(senderName: "망망망",
                          senderImage: UIImage(systemName: "doc.fill")!, // 이거 ! 가 아니라 다른걸로 해줄거임..!
                          messageContext: "미친 척이라 말해 what's the loss to me? Ya",
                          messageTime: Date())
        )
        messageList.append(
            RecentMessage(senderName: "몽몽이",
                          senderImage: UIImage(systemName: "doc.fill")!, // 이거 ! 가 아니라 다른걸로 해줄거임..!
                          messageContext: "예 암 뻐킹 톰보이",
                          messageTime: Date())
        )
        messageList.append(
            RecentMessage(senderName: "몽몽이",
                          senderImage: UIImage(systemName: "doc.fill")!, // 이거 ! 가 아니라 다른걸로 해줄거임..!
                          messageContext: "예 암 뻐킹 톰보이",
                          messageTime: Date())
        )
        messageList.append(
            RecentMessage(senderName: "몽몽이",
                          senderImage: UIImage(systemName: "doc.fill")!, // 이거 ! 가 아니라 다른걸로 해줄거임..!
                          messageContext: "예 암 뻐킹 톰보이",
                          messageTime: Date())
        )
        messageList.append(
            RecentMessage(senderName: "몽몽이",
                          senderImage: UIImage(systemName: "doc.fill")!, // 이거 ! 가 아니라 다른걸로 해줄거임..!
                          messageContext: "예 암 뻐킹 톰보이",
                          messageTime: Date())
        )

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                as? ChatCell else {
            return UITableViewCell()
        }
        cell.username.text = messageList[indexPath.row].senderName + " 견주"
        cell.content.text =  messageList[indexPath.row].messageContext
        cell.time.text =  getChatTime(date: messageList[indexPath.row].messageTime)
        cell.profileImage.image =  messageList[indexPath.row].senderImage

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 91.0
    }

    @IBOutlet var chatListView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        chatListView.delegate = self
        chatListView.dataSource = self

        addList()
    }

    // 수정된 뷰가 반영될 수 있도록 새로 테이블을 갱신
    override func viewWillAppear(_ animated: Bool) {
        chatTable.reloadData()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showChatRoom", sender: self)

        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let chatRoomVC = segue.destination as? ChatRoomVC {
            chatRoomVC.delegate = self
            chatRoomVC.messageList = messageList[(chatTable.indexPathForSelectedRow?.row)!]
            cellIndex = (chatTable.indexPathForSelectedRow?.row) ?? 0
            chatTable.deselectRow(at: chatTable.indexPathForSelectedRow!, animated: true)
        }
    }

    func userChatData(lastText: String?, lastTime: Date?) {
        if let lastText = lastText {
            self.messageList[cellIndex].messageContext = lastText
        }
        if let lastTime = lastTime {
            self.messageList[cellIndex].messageTime = lastTime
        }
    }
}
