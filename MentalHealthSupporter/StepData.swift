//
//  StepData.swift
//  MentalHealthSupporter
//
//  Created by fumitaka katou on 2021/06/23.
//

import UIKit
import Firebase

class StepData: NSObject {
    var id: String
    var isCompleted: Bool = false
    var title: String = ""

    // Firebaseからとってきた生データ＝document
    init(document: QueryDocumentSnapshot) {
        self.id = document.documentID

        let postDic = document.data()

        if let isCompleted = postDic["isCompleted"] as? Bool {
            self.isCompleted = isCompleted
        }
        
        if let title = postDic["title"] as? String {
            self.title = title
        }

    }
}
