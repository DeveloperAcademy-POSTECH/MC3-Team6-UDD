//
//  ChatRoomVC.swift
//  UDD
//
//  Created by SeongHoon Jang on 2022/07/26.
//

import UIKit

protocol ChatRoomVCDelegate: AnyObject {
    func userChatData(lastText: String?, lastTime: Date?)
}

class ChatRoomVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate {
    @IBOutlet weak var inputTextViewHeight: NSLayoutConstraint!

    @IBOutlet weak var chatTableView: UITableView! {
        didSet {
            chatTableView.delegate = self
            chatTableView.dataSource = self
            chatTableView.separatorStyle = .none
        }
    }

    // MARK: - chatData: 채팅을 저장할 배열
    var chatData = [String]()
    var lastText = ""
    var messageList: RecentMessage!
    weak var delegate: ChatRoomVCDelegate?

    // 채팅을 입력받기 위한 텍스트 뷰
    @IBOutlet weak var inputTextView: UITextView! {
        didSet {
            inputTextView.delegate = self
        }
    }

    // 바닥과 채팅창 사이의 margin을 나타냄
    @IBOutlet weak var inputViewBottomMargin: NSLayoutConstraint!
/*
    struct RecentMessage {
        let senderName: String! // 보낸사람 강아지 이름
        let senderImage: UIImage // 보낸사람 프로필 사진
        let messageContext: String
        let messageTime: Date
    }
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "\(messageList.senderName!)"
        lastText = messageList.messageContext

        // MARK: - 네비게이션바 더보기 버튼
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "ellipsis"),
            style: .plain,
            target: self,
            action: #selector(openTapped)
        )

        // MARK: - 셀 등록(register)
        chatTableView.register(UINib(nibName: "ChatInfoCell", bundle:nil),
                               forCellReuseIdentifier:"chatInfoCell")
        chatTableView.register(UINib(nibName: "MyCell", bundle:nil),
                               forCellReuseIdentifier:"myCell")
        chatTableView.register(UINib(nibName: "YourCell", bundle:nil),
                               forCellReuseIdentifier: "yourCell")

        // 채팅방 사용자 프사를 불러오기 위한 셀 추가
        chatData.append("")

        // MARK: - 키보드 관련 옵저버 설정
        NotificationCenter.default
            .addObserver(self, selector: #selector(keyBoardup),
                         name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default
            .addObserver(self, selector: #selector(keyBoardDown),
                         name: UIResponder.keyboardDidHideNotification, object: nil)
    }

    // view가 해제될 예정일 때 이전 뷰로 데이터 전달
    override func viewWillDisappear(_ animated: Bool) {
        self.delegate?.userChatData(
            lastText: lastText,
            lastTime: Date()
        )
    }

    // MARK: - 상단에 더보기 버튼 구현
    // 더보기를 누르면 Action Sheet가 나온다
    @objc func openTapped() {
        let action = UIAlertController(title: "버튼을 선택하세요.", message: nil, preferredStyle: .actionSheet)
        action.addAction(UIAlertAction(title: "채팅방 나가기", style: .default, handler: openAlert))
        action.addAction(UIAlertAction(title: "신고하기", style: .destructive, handler: openAlert))
        action.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(action, animated: true)
    }

    // 버튼을 누르면 나오는 알림창
    func openAlert(action: UIAlertAction) {
        guard let selected: String = action.title else { return }
        var message = "알림창 내용"
        var yesButton = "확인버튼 내용"

        switch selected {

        case "채팅방 나가기":
            message = "정말 채팅창을 나가실건가요?"
            yesButton = "나가기"

        case "신고하기":
            message = "정말 신고 하실건가요?\n신고한 유저와는 채팅을 하실 수 없습니다."
            yesButton = "신고하기"

        default:
            break
        }

        let alert = UIAlertController(title: selected, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "아니요", style: .default) { _ in
            print("취소버튼 누름")
        })
        alert.addAction(UIAlertAction(title: yesButton, style: .destructive) { _ in
          print("\(yesButton) 버튼 입니다.")
            self.navigationController?.popViewController(animated: true)
        })
        self.present(alert, animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }

    @objc func keyBoardup(noti: Notification) {
        let notiInfo = noti.userInfo!
        let keyboardFrame = notiInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        let height = keyboardFrame.size.height - self.view.safeAreaInsets.bottom
        let animationDuration = notiInfo[ UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval

        // 키보드 올라오는 애니메이션이랑 동일하게 텍스트뷰 올라가게 만들기.
        UIView.animate(withDuration: animationDuration) {
            self.inputViewBottomMargin.constant = height
            self.view.layoutIfNeeded()
        }
    }

    @objc func keyBoardDown(noti: Notification) {
        let notiInfo = noti.userInfo!
        let animationDuration = notiInfo[ UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        UIView.animate(withDuration: animationDuration) {
            self.inputViewBottomMargin.constant = 0
            self.view.layoutIfNeeded()
        }
    }

    // 텍스트뷰에 있는 값이 chatData array에 들어간다
    @IBAction func chatSendButton(_ sender: Any) {
        if inputTextView.text != "" {
            chatData.append(inputTextView.text)
            lastText = inputTextView.text
            inputTextView.text = ""
        } else { return }

        let lastindexPath = IndexPath(row: chatData.count - 1, section: 0)

        chatTableView.insertRows(at: [lastindexPath], with: UITableView.RowAnimation.automatic)
        inputTextViewHeight.constant = 35
        chatTableView.scrollToRow(at: lastindexPath, at: UITableView.ScrollPosition.bottom, animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatData.count
    }
    // 상대방의 셀, 내가 썼을 때 셀이 번갈아가며 나옴
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 첫번째로 보여줄 셀
        if indexPath.row == 0 {

            let firstCell = tableView
                .dequeueReusableCell(withIdentifier: "chatInfoCell", for: indexPath) as! ChatInfoCell
            firstCell.chatImage.image = UIImage(named: "golddog")
            firstCell.todayDate.text = nowKorDate()
            firstCell.selectionStyle = .none
            return firstCell
        } else if indexPath.row % 2 == 1 {

            let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyCell
            myCell.myTextView.text = chatData[indexPath.row]
            myCell.mySendTime.text = nowKorTime()
            myCell.selectionStyle = .none
            return myCell
        } else {
            let yourCell = tableView.dequeueReusableCell(withIdentifier:"yourCell",for:indexPath) as! YourCell

            yourCell.yourTextView.text = chatData[indexPath.row]
            yourCell.yourReceiveTime.text = nowKorTime()
            yourCell.selectionStyle = .none
            return yourCell
        }
    }

    func textViewDidChange(_ textView: UITextView) {
        if textView.contentSize.height <= 35 {
            inputTextViewHeight.constant = 35
        } else if textView.contentSize.height >= 102 {
            inputTextViewHeight.constant = 102
        } else {
            inputTextViewHeight.constant = textView.contentSize.height
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         self.view.endEditing(true)
   }
}

func nowKorTime() -> String {
    let current = Date()
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "ko_kr")
    formatter.timeZone = TimeZone(abbreviation: "KST")
    formatter.dateFormat = "a h:mm"
    formatter.amSymbol = "오전"
    formatter.pmSymbol = "오후"
    return formatter.string(from: current)
}

func nowKorDate() -> String {
    let current = Date()
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "ko_kr")
    formatter.timeZone = TimeZone(abbreviation: "KST")
    formatter.dateFormat = "yyyy년 MM월 dd일"
    return formatter.string(from: current)
}
