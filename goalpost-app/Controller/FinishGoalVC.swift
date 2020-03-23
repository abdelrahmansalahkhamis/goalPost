//
//  FinishGoalVC.swift
//  goalpost-app
//
//  Created by abdulrahman on 11/12/18.
//  Copyright © 2018 abdulrahmanAbdou. All rights reserved.
//

import UIKit
import CoreData

class FinishGoalVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var createGoalBtn: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!
    
    var goalDescription: String!
    var goalType: GoalType!
    
    func initData(description: String, type: GoalType){
        self.goalDescription = description
        self.goalType = type
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalBtn.bindToKeyboard()
        pointsTextField.delegate = self
    }

    @IBAction func createGoalPressed(_ sender: Any) {
        if pointsTextField.text != ""{
            self.save { (complete) in
                if complete{
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismissDetail()
    }
    
    func save(completion: (_ finished: Bool)->()){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else {return}
        
        let goal = Goal(context: managedContext)
        
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do{
            try managedContext.save()
            print("successfully saved")
            completion(true)
        }catch let error{
            debugPrint("could not save: \(error.localizedDescription)")
            completion(false)
        }
    }
    
}
