//
//  DetailUserViewController.swift
//  PrismaMedia
//
//  Created by Anis on 19/05/2022.
//

import Foundation
import UIKit

class DetailUserViewController: UIViewController {

    let notificationCenter = NotificationCenter.default

    var viewModel: DetailUserViewModel?
    var index: Int?

    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var firstNameUserTextField: UITextField!
    @IBOutlet weak var lastNameUserTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        setElements()
        setAvatar()
    }

    private func setElements () {
        guard let viewModel = self.viewModel else {return}
        firstNameUserTextField.text = viewModel.user.first_name
        lastNameUserTextField.text = viewModel.user.last_name
    }

    private func setAvatar () {
        guard let viewModel = self.viewModel else {return}
        viewModel.loadUserAvatar { [weak self] data in
            guard let self = self else {return}
            self.imageUser.image = UIImage(data: data)
        }
    }

    @IBAction func submitButton () {
        guard let viewModel = viewModel,
              let index = index,
              let firstName = firstNameUserTextField.text,
              let lastName = lastNameUserTextField.text
        else {return}

        viewModel.user.first_name = firstName
        viewModel.user.last_name = lastName

        NotificationCenter.default.post(
            name: .submitButton,
            object: nil,
            userInfo: [Notification.Name.submitButton: viewModel.user, "index": index])
    }
}
