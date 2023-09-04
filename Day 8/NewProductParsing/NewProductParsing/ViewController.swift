//
//  ViewController.swift
//  NewProductParsing
//
//  Created by Lawrence on 9/1/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        readLocalFile()
    }
    
    func readLocalFile() {
        guard let url = Bundle.main.url(forResource: "products", withExtension: "json") else { return }
        
        do {
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let response = try decoder.decode([Product?].self, from: data)
            print(response)
            
        } catch {
            print(error)
        }
    }


}

