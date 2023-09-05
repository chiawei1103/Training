//
//  ViewController.swift
//  CountryList
//
//  Created by Lawrence on 9/4/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate, UITableViewDelegate {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var countries: [Country]?
    var searchData: [Country]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getCountry()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self

        searchData = countries
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchData = countries
        searchBar.endEditing(true)
        tableView.reloadData()
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchData = searchText.isEmpty ? countries : countries?.filter{ (item: Country) in
            return item.name.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return countries?.count ?? 0
        return searchData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryTableViewCell", for: indexPath) as? CountryTableViewCell
//        guard let countries = countries else { return UITableViewCell() }
        guard let countries = searchData else { return UITableViewCell() }
        
        let name = countries[indexPath.row].name
        let code = countries[indexPath.row].code
        let capital = countries[indexPath.row].capital
        let currency = countries[indexPath.row].currency.name
        let currencySymbol = countries[indexPath.row].currency.symbol
        let language = countries[indexPath.row].language.name
        let region = countries[indexPath.row].region
//        let flagUrl = countries[indexPath.row].flag
        
        cell?.countryNameLabel.text = name
        cell?.capitalLabel.text = capital
        cell?.codeLabel.text = code
        cell?.currencyLabel.text = currency
        cell?.currencySymbolLabel.text = currencySymbol
        cell?.languageLabel.text = language
        cell?.regionLabel.text = region
        cell?.flagImage.image = UIImage(systemName: "flag")
        
//        print("flag: \(URL(string: flagUrl))")
//        let image = UIImageView()
//        image.load(url: URL(string: flagUrl)!)
//        print("image: \(image.image?.size)")
//        cell?.flagImage.image = image.image
        
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
                    self.searchData = self.countries
                    self.tableView.reloadData()
                    
                }

            } catch {
                print(error)
            }
        }
        dataTask.resume()
    }
}

extension UIImageView {
    func load(url: URL) {
        print("url: \(url)")
        DispatchQueue.global().async { [weak self] in
            do {
                let data = try Data(contentsOf: url)
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            } catch {
                print(error)
            }
        }
    }
}

