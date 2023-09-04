//
//  ViewController.swift
//  CountryList
//
//  Created by Lawrence on 9/4/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var tableVIew: UITableView!
    
    var countries: [Country]?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getCountry()
        tableVIew.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryTableViewCell", for: indexPath) as? CountryTableViewCell
        guard let countries = countries else { return UITableViewCell() }
        
        let name = countries[indexPath.row].name
        let code = countries[indexPath.row].code
        let capital = countries[indexPath.row].capital
        let currency = countries[indexPath.row].currency.name
        let currencySymbol = countries[indexPath.row].currency.symbol
        let language = countries[indexPath.row].language.name
        let region = countries[indexPath.row].region
//        let flag = countries[indexPath.row.flag
        
        cell?.countryNameLabel.text = name
        cell?.capitalLabel.text = capital
        cell?.codeLabel.text = code
        cell?.currencyLabel.text = currency
        cell?.currencySymbolLabel.text = currencySymbol
        cell?.languageLabel.text = language
        cell?.regionLabel.text = region
        cell?.flagImage.image = UIImage(systemName: "flag")
        
        return cell ?? UITableViewCell()
    }
    
    func getCountry() {
        guard let url = URL(string: "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json") else { return }
        
        let urlRequest = URLRequest(url: url)
        
        let urlSession = URLSession(configuration: URLSessionConfiguration.default)
        
        let dataTask = urlSession.dataTask(with: urlRequest) { data, urlResponse, error in
            
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            do {
                self.countries = try decoder.decode([Country].self, from: data)
                DispatchQueue.main.async {
                    self.tableVIew.reloadData()
                }
                
            } catch {
                print(error)
            }
        }
        dataTask.resume()
        
    }


}

