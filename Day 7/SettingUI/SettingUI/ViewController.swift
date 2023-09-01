//
//  ViewController.swift
//  SettingUI
//
//  Created by Lawrence on 8/31/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var responseJSON: Accessiblity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        readLocalFile()
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var key: String?
        if let accessibility = responseJSON?.accessiblity[section] {
            for section in accessibility {
                key = section.key
            }
        }
        return key
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return responseJSON?.accessiblity.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var num: Int = 0
        if let accessibility = responseJSON?.accessiblity[section] {
            for section in accessibility {
                num = section.value.count
            }
        }
        return num
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingTableCell", for: indexPath)
        if let acceessiblity = responseJSON?.accessiblity[indexPath.section] {
            for section in acceessiblity {
                cell.textLabel?.text = section.value[indexPath.row].label
                cell.imageView?.image = UIImage(systemName: section.value[indexPath.row].icon)
            }
        }
        return cell
    }
    
    func readLocalFile() {
        guard let url = Bundle.main.url(forResource: "Setting", withExtension: "json") else { return }
        
        do {
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            
            responseJSON = try decoder.decode(Accessiblity.self, from: data)
        } catch {
            print(error)
        }
    }
}

