//
//  ViewController.swift
//  ProductsTableView
//
//  Created by Consultant on 8/30/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    
    
    @IBOutlet weak var productTableView: UITableView!
    
    var responseJSON: ProductsData?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        readLocalFile()
        productTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return responseJSON?.products.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableCell = productTableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as? ProductTableViewCell
        
        let title = responseJSON?.products[indexPath.row].title
        let description = responseJSON?.products[indexPath.row].description
        let price = String(responseJSON?.products[indexPath.row].price ?? 0)
        let discount = String(responseJSON?.products[indexPath.row].discountPercentage ?? 0)
        let rating = String(responseJSON?.products[indexPath.row].rating ?? 0)
        let stock = String(responseJSON?.products[indexPath.row].stock ?? 0)
        let brand = responseJSON?.products[indexPath.row].brand
        let category = responseJSON?.products[indexPath.row].category
        let thumbnail = responseJSON?.products[indexPath.row].thumbnail ?? ""
        let images:[String] = responseJSON?.products[indexPath.row].images ?? [""]
        
        for (index, imageUrl) in images.enumerated() {
            tableCell?.images[index].image = getUIImage(url: imageUrl)
        }
        
        tableCell?.titleLabel.text = title
        tableCell?.desLabel.text = description
        tableCell?.priceLabel.text = "$ \(price)"
        tableCell?.discountLabel.text = discount
        tableCell?.ratingLabel.text = rating
        tableCell?.stockLabel.text = stock
        tableCell?.brandLabel.text = brand
        tableCell?.categoryLabel.text = category
        tableCell?.thumbnailImage.image = getUIImage(url: thumbnail)
        
        return tableCell ?? UITableViewCell()
    }
    
//    @MainActor
    func getUIImage(url: String) -> UIImage {
        var image: UIImage?
        if let url = URL(string: url) {
//            DispatchQueue.global().async {
//                do {
//                    let data = try Data(contentsOf: url)
//                    if let uiimage = UIImage(data: data) {
//                        DispatchQueue.main.async {
//                            image = uiimage
//                        }
//                    }
//                } catch {
//                    print(error.localizedDescription)
//                }
//            }
//            return image ?? UIImage()
            
            let imageData: Data?
            do {
                imageData = try Data(contentsOf: url)
                if let data = imageData {
                    image = UIImage(data: data)
                    return image ?? UIImage()
                }
            } catch {
                print(error)
            }
        }
        return image ?? UIImage()
    }
    
    
    
    func readLocalFile() {
        guard let url = Bundle.main.url(forResource: "Products", withExtension: "json") else { return }
        
        do {
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            
            responseJSON = try decoder.decode(ProductsData.self, from: data)
            
        } catch {
            print(error)
        }
        
    }


}

