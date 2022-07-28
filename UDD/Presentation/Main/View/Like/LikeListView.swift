//
//  LikeListView.swift
//  UDD
//
//  Created by 최홍준 on 2022/07/27.
//

import UIKit

class LikeListView: UIViewController, UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var likeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var likeTableView: UITableView!

    var opponentDogLikeDataModel = Array(repeating: [OpponentDogLikeDataModel](), count: 2)

    override func viewDidLoad() {
        super.viewDidLoad()
        likeTableView.register(LikeTableViewCell.nib(), forCellReuseIdentifier: LikeTableViewCell.identifier)
        likeTableView.delegate = self
        likeTableView.dataSource = self
        addOpponentDummy1()
        addOpponentDummy2()
        addOpponentDummy3()
        addOpponentDummy4()
        addOpponentDummy5()
    }

    func addOpponentDummy1() {
        opponentDogLikeDataModel[0].append(
            OpponentDogLikeDataModel(
                opponentDogName: "뽀삐",
                opponentDogImage: "golddog",
                opponentDogUUID: UUID().uuidString,
                isReceived: true
            )
        )
    }

    func addOpponentDummy2() {
        opponentDogLikeDataModel[0].append(
            OpponentDogLikeDataModel(
                opponentDogName: "뽀식",
                opponentDogImage: "golddog",
                opponentDogUUID: UUID().uuidString,
                isReceived: true
            )
        )
    }

    func addOpponentDummy3() {
        opponentDogLikeDataModel[1].append(
            OpponentDogLikeDataModel(
                opponentDogName: "두부",
                opponentDogImage: "golddog",
                opponentDogUUID: UUID().uuidString,
                isReceived: false
            )
        )
    }

    func addOpponentDummy4() {
        opponentDogLikeDataModel[1].append(
            OpponentDogLikeDataModel(
                opponentDogName: "마루",
                opponentDogImage: "golddog",
                opponentDogUUID: UUID().uuidString,
                isReceived: false
            )
        )
    }

    func addOpponentDummy5() {
        opponentDogLikeDataModel[1].append(
            OpponentDogLikeDataModel(
                opponentDogName: "애플",
                opponentDogImage: "golddog",
                opponentDogUUID: UUID().uuidString,
                isReceived: false
            )
        )
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch likeSegmentedControl.selectedSegmentIndex {
        case 0:
            return opponentDogLikeDataModel[0].count
        case 1:
            return opponentDogLikeDataModel[1].count
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: LikeTableViewCell.identifier,
            for: indexPath
        ) as! LikeTableViewCell
        cell.configure(
            with: opponentDogLikeDataModel[likeSegmentedControl.selectedSegmentIndex][indexPath.row]
        )
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        likeTableView.deselectRow(at: likeTableView.indexPathForSelectedRow!, animated: true)
    }

    @IBAction func segmentedChange(_ sender: Any) {
        likeTableView.reloadData()
    }
}
