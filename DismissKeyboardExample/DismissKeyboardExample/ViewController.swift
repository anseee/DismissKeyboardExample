//
//  ViewController.swift
//  DismissKeyboardExample
//
//  Created by 박성원 on 05/12/2019.
//  Copyright © 2019 sungwon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    var tabGR = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    @objc func keyboardWillShow(_ notification: Notification) {

        self.tableView.removeGestureRecognizer(self.tabGR)
        self.tabGR = UITapGestureRecognizer.init(target: self, action: #selector(self.tabOnView(gesture:)))
        self.tableView.addGestureRecognizer(self.tabGR)
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        view.layoutIfNeeded()
        
        self.tableView.removeGestureRecognizer(self.tabGR)
    }
 
    @objc func tabOnView(gesture: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
}

