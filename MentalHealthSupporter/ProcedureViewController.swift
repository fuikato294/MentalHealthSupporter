//
//  ProcedureViewController.swift
//  MentalHealthSupporter
//
//  Created by fumitaka katou on 2021/06/17.
//

import UIKit

class ProcedureViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    // 手続き項目を格納する配列
    // 3つの画面で流用される共通データ
    var dataArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // カスタムセルを登録する
        let nib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        // cellという名前のデータを乗っけるお皿を用意する
        // UITableViewCell.self → nib　に変更
        tableView.register(nib, forCellReuseIdentifier: "Cell")

    }
    
    // データの数（＝セルの数）を返すメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    // 各セルの内容を返すメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // cell　という名前のデータを取ってくる
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        cell.title = dataArray[indexPath.row]
        
        return cell
    }

}

