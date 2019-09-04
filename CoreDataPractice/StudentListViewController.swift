//
//  StudentListViewController.swift
//  CoreDataPractice
//
//  Created by IMACDEV on 15/04/19.
//  Copyright © 2019 IMACDEV. All rights reserved.
//

import UIKit
protocol DataPass {
    func data(object:[String:String],index:Int,isEdit:Bool)
}
class StudentListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var student = [Student]()
    var delegate:DataPass!
    //MARK:- Outlets
    @IBOutlet weak var studentTableview: UITableView!

    @IBAction func backBtnAct(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        student = DatabaseHelper.sharedInsatance.getStudentData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK:- Tableview Delegate , DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return student.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  self.studentTableview.dequeueReusableCell(withIdentifier: "studentListCell") as! studentListCell
        if student.count > 0
        {
            let studentData = student[indexPath.row]
            cell.student = studentData
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            student = DatabaseHelper.sharedInsatance.deleteData(index: indexPath.row)
            self.studentTableview.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let data = student[indexPath.row]
         let dict = ["name":data.name,"address":data.address,"city":data.city,"mobile":data.mobile]
        
        delegate.data(object: dict as! [String:String], index: indexPath.row, isEdit: true)

        self.navigationController?.popViewController(animated: true)
    }

}
