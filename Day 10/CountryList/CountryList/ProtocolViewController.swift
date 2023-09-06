//
//  ProtocolViewController.swift
//  CountryList
//
//  Created by Lawrence on 9/5/23.
//

import UIKit

protocol NetworkManagerAction {
//    func getData(countries: [Country]?, error: Error?)
    func getData(result: Result<[Country], NetworkError>)
}

class ProtocolViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate, NetworkManagerAction {
    
    var countries: [Country]?
    var searchData: [Country]?
    let networkManagerProtocol = NetworkManagerProtocol()
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        searchBar.delegate = self
        networkManagerProtocol.delegate = self
        networkManagerProtocol.getCountry()

        searchData = countries
    }
    
    func getData(result: Result<[Country], NetworkError>) {
        switch result {
        case .success(let countries):
            self.countries = countries
            self.searchData = self.countries
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        case .failure(let failure):
            DispatchQueue.main.sync {
                self.errorLabel.frame.size = CGSize(width: 350, height: 100)
                self.errorLabel.text = "Warning: \(failure.localizedDescription)"
            }
        }
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
        cell?.flagImage.image = UIImage(systemName: "flag")?.withTintColor(.brown, renderingMode: .alwaysOriginal)
        
//        print("flag: \(URL(string: flagUrl))")
//        let image = UIImageView()
//        image.load(url: URL(string: flagUrl)!)
//        print("image: \(image.image?.size)")
//        cell?.flagImage.image = image.image
        
        return cell ?? UITableViewCell()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
