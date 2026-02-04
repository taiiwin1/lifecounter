//
//  HistoryViewController.swift
//  lifecounter
//
//  Created by Tai Nguyen on 2/3/26.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var history: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath)
        cell.textLabel?.text = history[indexPath.row]
        return cell
    }
}
