//
//  ViewController.swift
//  NYCHighSchools
//
//  Created by Lawrence on 9/7/23.
//

import UIKit

class ViewController: UIViewController {
    
    let viewModel = ViewModel()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBG()
        
        Task {
            let result = await viewModel.getHighSchoolList()
            switch result {
            case .success( _):
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let failure):
                print(failure)
            }
        }
        tableView.layer.zPosition = 1
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func setBG() {
        
        let layer1 = CAGradientLayer()
        layer1.colors = [
        UIColor(red: 0.902, green: 0.333, blue: 0.749, alpha: 1).cgColor,
        UIColor(red: 0.192, green: 0.035, blue: 0.816, alpha: 1).cgColor,
        UIColor(red: 0.439, green: 0.157, blue: 0.682, alpha: 1).cgColor
        ]
        layer1.locations = [0, 0.43, 1]
        layer1.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer1.endPoint = CGPoint(x: 0.75, y: 0.5)
        view.layer.addSublayer(layer1)
        layer1.frame = view.frame
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.alpha = 0.8
        
        let imageView = UIImageView(image: UIImage(named: "BGImage"))
        imageView.frame = view.bounds
        imageView.contentMode = .scaleToFill
        imageView.addSubview(blurEffectView)
        view.addSubview(imageView)
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let schoolDetailViewController = segue.destination as? SchoolDetailViewController
        
        // Get the index path from the cell that was tapped
        let indexPath = tableView.indexPathForSelectedRow
        // Get the Row of the Index Path and set as index
        guard let index = indexPath?.row else { return }
        schoolDetailViewController?.school = viewModel.highSchoolList?[index]
    }
}

// MARK: - TableView
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.highSchoolList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let highSchoolList = viewModel.highSchoolList else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "schoolTableViewCell", for: indexPath) as? SchoolTableViewCellController
        
        cell?.schoolNameLabel.text = highSchoolList[indexPath.row].schoolName
        
        let imageName = highSchoolList[indexPath.row].schoolName.first?.lowercased() ?? "exclamationmark"
        
        cell?.schoolImage.image = UIImage(systemName: "\(imageName).circle")
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        backgroundView.layer.cornerRadius = 15
        cell?.selectedBackgroundView = backgroundView
        
        return cell ?? UITableViewCell()
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        performSegue(withIdentifier: "toSchoolDetail", sender: cell)
    }
}

