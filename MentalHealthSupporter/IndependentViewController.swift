//
//  IndependentViewController.swift
//  MentalHealthSupporter
//
//  Created by fumitaka katou on 2021/06/14.
//

import UIKit

class IndependentViewController: ProcedureViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        dataArray = [
        "STEP 1",
        "STEP 2",
        "STEP 3",
        "STEP 4",
        "STEP 5"
        ]
    }
    
    // 各セルを選択した時に実行されるメソッド(ここで手続き説明画面に遷移させる)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }


}
