//
//  ViewController.swift
//  CoreDataPractice
//
//  Created by IMACDEV on 15/04/19.
//  Copyright © 2019 IMACDEV. All rights reserved.
//

import UIKit

class FormViewController: UIViewController,DataPass {

    var i = Int()
    var isUpdate = Bool()
    
    //MARK :- OUTLETS
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var showBtn: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func saveBtnAct(_ sender: Any)
    {
        let dict = ["name": nameTextField.text,"address":addressTextField.text,"city":cityTextField.text,"mobile":mobileTextField.text]
        print("dict:\(dict)")
        
        if isUpdate
        {
            DatabaseHelper.sharedInsatance.editData(object: dict as! [String:String], i: i)
        }
        else
        {
            DatabaseHelper.sharedInsatance.save(object: dict as! [String : String])

        }
     
    }
    @IBAction func showBtnAct(_ sender: Any)
    {
        
        let studentListVC = self.storyboard?.instantiateViewController(withIdentifier: "StudentListViewController") as! StudentListViewController
        studentListVC.delegate = self
        self.navigationController?.pushViewController(studentListVC, animated: true)
        
     
    }
    func data(object: [String : String], index: Int, isEdit: Bool) {
        nameTextField.text = object["name"]
        addressTextField.text = object["address"]
        cityTextField.text = object["city"]
        mobileTextField.text = object["mobile"]
        
        i = index
        isUpdate = isEdit
    }
    
    
}

