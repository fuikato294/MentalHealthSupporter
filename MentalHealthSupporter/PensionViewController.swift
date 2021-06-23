//
//  PensionViewController.swift
//  MentalHealthSupporter
//
//  Created by fumitaka katou on 2021/06/14.
//

import UIKit

class PensionViewController: ProcedureViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 各セルを選択した時に実行されるメソッド(ここで手続き説明画面に遷移させる)
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        }
        
        dataArray = [
        "STEP 11",
        "STEP 12",
        "STEP 13",
        "STEP 14",
        "STEP 15"
        ]
    }


}
