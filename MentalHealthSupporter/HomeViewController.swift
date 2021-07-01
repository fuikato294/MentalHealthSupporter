//
//  HomeViewController.swift
//  MentalHealthSupporter
//
//  Created by fumitaka katou on 2021/06/14.
//

import UIKit
import Firebase

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
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
    
    // 27~36はCollectionViewに関する記述
    // cellの色の配列
    let colors: [UIColor] = [UIColor.black, UIColor.blue, UIColor.brown, UIColor.cyan, UIColor.darkGray, UIColor.darkText, UIColor.gray, UIColor.green, UIColor.lightGray, UIColor.orange, UIColor.red]
    // cellの色の名前の配列
    let colorNames: [String] = ["black", "blue", "brown", "cyan", "darkGray", "darkText", "gray", "green", "lightGray", "orange", "red"]

    // 画面遷移先に渡す色
    var giveColor: UIColor = UIColor.black
    // 画面遷移先に渡す色の名前
    var giveColorName: String = "black"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
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
    
    // 67~102はCollectionViewに関する記述
    // cellの数を返す関数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }

    // cellに情報を入れていく関数
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Identifierが"CollectionViewCell"でCollectionViewCellというクラスのcellを取得
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell

        cell.image = UIImage(named: "Home black")
        cell.topic = "トピック"

        return cell
    }

    // cell選択時に呼ばれる関数
    // 画面遷移先に渡すデータをここで格納する
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        giveColor = colors[indexPath.item]
        giveColorName = colorNames[indexPath.item]
        // Identifierが"Segue"のSegueを使って画面遷移する関数
        performSegue(withIdentifier: "Segue", sender: nil)
    }

    // 画面遷移先のViewControllerを取得し、データを渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Segue" {
            let vc = segue.destination as! UIViewController

        }
    }

}
