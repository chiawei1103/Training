//
//  ViewController.swift
//  LoginTableView
//
//  Created by Consultant on 8/29/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var students: [Student] = []
    var userName: String?
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createStudent()
        tableView.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath) as? StudentCell
        cell?.nameLabel.text = students[indexPath.row].name
        cell?.emailLabel.text = students[indexPath.row].email
        cell?.dobLabel.text = students[indexPath.row].dob
        cell?.avatar.image = students[indexPath.row].avatar
        
        return cell ?? UITableViewCell()
    }
    
    func createStudent() {
        for index in (1...10) {
            let student = Student(name: "student \(index)", email: "email\(index)@gamil.com", dob: "08/\(index)/2000", avatar: UIImage(named: "student\(index)") ?? UIImage())
            students.append(student)
        }
    }

}

class Student {
    let name: String , email: String , dob: String, avatar: UIImage
    
    init(name: String, email: String, dob: String, avatar: UIImage) {
        self.name = name
        self.email = email
        self.dob = dob
        self.avatar = avatar
    }
}

