//
//  ViewController.swift
//  PrismaMedia
//
//  Created by Anis on 16/05/2022.
//

import UIKit

class UsersViewCell: UITableViewCell {

}

class UsersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let viewModel: UsersViewModel = UsersViewModel()
    let notificationCenter = NotificationCenter.default

    override func viewDidLoad() {
        super.viewDidLoad()
        initNavigationBar()
        initTableView()
        fetchUsers()
        addObserver()
    }

    private func addObserver () {
        notificationCenter.addObserver(self,
                         selector: #selector(submitButtonListener),
                                       name: .submitButton,
                         object: nil)
    }

    @objc
    func submitButtonListener(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
              let user = userInfo[Notification.Name.submitButton] as? APIModel.DataAPI,
              let index = userInfo["index"] as? Int,
              index < viewModel.userList.count
        else { return }

        viewModel.userList[index] = user
        tableView.reloadData()
    }

    private func initNavigationBar() {
        title = "Users List"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshList))
    }

    @objc
    func refreshList () {
        viewModel.userList = []
        tableView.reloadData()
        fetchUsers()
    }

    private func initTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func fetchUsers () {
        viewModel.refreshList { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension UsersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detail = storyboard.instantiateViewController(withIdentifier: "DetailUserViewController") as! DetailUserViewController
        detail.viewModel = DetailUserViewModel(user: viewModel.userList[indexPath.row])
        detail.index = indexPath.row
        navigationController?.pushViewController(detail, animated: true)
    }
}

extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UsersViewCell", for: indexPath) as! UsersViewCell
        cell.textLabel?.text = viewModel.userList[indexPath.row].first_name
        cell.detailTextLabel?.text = viewModel.userList[indexPath.row].last_name
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.userList.count
    }
}

