//
//  HomeViewController.swift
//  MentalHealthSupporter
//
//  Created by fumitaka katou on 2021/06/14.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var setupButton: UIButton!
    @IBAction func setupAccount(_ sender: Any) {
        // currentUserがnilならログインしていない
        if Auth.auth().currentUser == nil {
            // ログインしていないときの処理
            let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: "Login")
            self.present(loginViewController!, animated: true, completion: nil)
        } else {
            let settingViewController = self.storyboard?.instantiateViewController(withIdentifier: "Setting")
            self.present(settingViewController!, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // ログインしている時としていない時でbuttonとlabelの表示を変える
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Authというのは、Firebaseの機能を指している
        // currentUserがnilだったら”ログイン”にするし、そうでなければ（ログインしていれば）名前を”設定”に変える
        // currentUserがnilだったら”No Name”にするし、そうでなければ（ログインしていれば）userNameLabelの名前を”displayName”に変える
        if Auth.auth().currentUser == nil {
            setupButton.setTitle(" ログイン", for: .normal)
            userNameLabel.text = " No Name"
            return
        } else {
            setupButton.setTitle(" 設定", for: .normal)
            // 表示名を取得してTextFieldに設定する
            let user = Auth.auth().currentUser
            if let user = user {
                userNameLabel.text = user.displayName
                return
            }
        }
        

        
    }

}
