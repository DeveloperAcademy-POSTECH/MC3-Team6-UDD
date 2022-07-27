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

class ChatListController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let username = ["똘이 견주", "짱아 견주", "뫄뫄 견주", "어쩌구 견주주", "고양이 견주", "고양이 견주", "고양이 견주", "고양이 견주"]
    let content = ["미친 척이라 말해 what's the loss to me? Ya",
                   "사정없이 씹으라고 you're lost to me ya",
                   "사랑 그깟 거 따위 내 눈에 눈물 한 방울 어림없지지지지지 베이비베이비베이비비에비",
                   "너의 하찮은 말에 미소나 지을 바엔", "예 암 뻐킹 톰보이", "예 암 뻐킹 톰보이", "예 암 뻐킹 톰보이", "예 암 뻐킹 톰보이"]
    let time = ["12:34","10:22","09:58","08:10","00:04","00:03","00:02","00:00"]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return username.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                as? ChatCell else {
            return UITableViewCell()
        }

        cell.username.text = username[indexPath.row]
        cell.content.text = content[indexPath.row]
        cell.time.text = time[indexPath.row]
        cell.profileImage.image = UIImage(systemName: "doc.fill")

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
    }

}
