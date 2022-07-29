//
//  ChatRoomVC.swift
//  UDD
//
//  Created by SeongHoon Jang on 2022/07/26.
//

import UIKit

class ChatRoomVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate {
    // 텍스트필드의 높이
    @IBOutlet weak var inputTextViewHeight: NSLayoutConstraint!
    // 테이블 뷰 오브젝트를 코드에 끌어다 쓰게 되면 반드시 해야하는 초기화 작업
    @IBOutlet weak var chatTableView: UITableView! {
        didSet { // 오브젝트 생성했을 때
            // delegate는 어떤 행동에 대한 "동작"을 제시
            chatTableView.delegate = self
            // dataSource는 "보여주는" 것들 담당
            chatTableView.dataSource = self
            // 테이블 뷰 구분선 없애는 것
            chatTableView.separatorStyle = .none
        }
    }
    // MARK: - chatDatas: 채팅을 저장할 배열
    var chatDatas = [String]()
    // 채팅을 입력받기 위한 텍스트 뷰
    @IBOutlet weak var inputTextView: UITextView! {
        didSet {
            inputTextView.delegate = self
        }
    }
    // 텍스트창 있는 View의 BottomMargin
    // (View Bottom <-> Safe Area Bottom)
    @IBOutlet weak var inputViewBottomMargin: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.hideKeyboardWhenTappedAround()
        // 사용하려는 셀을 등록해야 사용할 수 있다.
        chatTableView.register(UINib(nibName: "MyCell", bundle:nil), forCellReuseIdentifier:"myCell")
        // nibName : xib 파일 이름.
        // forCellReuseIdentifier: Cell의 identifier. xib파일안에서 설정가능
        chatTableView.register(UINib(nibName: "YourCell", bundle:nil), forCellReuseIdentifier: "yourCell")
        // 키보드 관련 옵저버 설정을 해야 함.
        // 키보드 올라올 때.
        NotificationCenter.default
            .addObserver(self, selector: #selector(keyBoardup),
                         name: UIResponder.keyboardWillShowNotification, object: nil)
        // 키보드 내려올 때.
        NotificationCenter.default
            .addObserver(self, selector: #selector(keyBoardDown),
                         name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    @objc func keyBoardup(noti: Notification) {
        let notiInfo = noti.userInfo!
        let keyboardFrame = notiInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        // 홈 버튼 없는 아이폰들은 다 빼줘야함.
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
    // 텍스트뷰에 있는 값이 chatDatas array에 들어간다
    @IBAction func chatSendButton(_ sender: Any) {
        if inputTextView.text != "" {
            chatDatas.append(inputTextView.text)
            inputTextView.text = ""
        } else { return }
        let lastindexPath = IndexPath(row: chatDatas.count - 1, section: 0)
        // 방법 1 : chatTableView.reloadData()
        // 방법 2 :
        chatTableView.insertRows(at: [lastindexPath], with: UITableView.RowAnimation.automatic)
        inputTextViewHeight.constant = 35
        // TableView에는 원하는 곳으로 이동하는 함수가 있다. 고로 전송할때마다 최신 대화로 이동.
        chatTableView.scrollToRow(at: lastindexPath, at: UITableView.ScrollPosition.bottom, animated: true)
        /* 티키타카를 하기 위한 공간 */
        
    }
    // 테이블 뷰를 사용하게 되면 무조건 구현해야하는 함수 2개.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatDatas.count
    }
    // 원래는 상대방이 썼을 때 상대방의 셀, 내가 썼을 때 내 셀이 나와야 하는데 이거는 그냥 번갈아가면서 나오게 하는 거임.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
            // MyCell 형식으로 사용하기 위해 형변환이 필요하다.
            let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyCell
            // 버튼 누르면 chatDatas 에 텍스트를 넣을 것이기 때문에 거기서 꺼내오면 되는거다.
            myCell.myTextView.text = chatDatas[indexPath.row]
            myCell.mySendTime.text = nowKorTime()
            myCell.selectionStyle = .none
            return myCell
        } else {
            let yourCell = tableView.dequeueReusableCell(withIdentifier:"yourCell",for:indexPath) as! YourCell
            yourCell.yourTextView.text = chatDatas[indexPath.row]
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
    // 한국 시간으로 표시
    formatter.locale = Locale(identifier: "ko_kr")
    formatter.timeZone = TimeZone(abbreviation: "KST")
    // 형태 변환
    formatter.dateFormat = "a h:mm"
    formatter.amSymbol = "오전"
    formatter.pmSymbol = "오후"
    return formatter.string(from: current)
}
