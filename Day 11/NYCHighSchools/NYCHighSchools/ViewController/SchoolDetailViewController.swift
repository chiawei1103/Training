//
//  SchoolDetailViewController.swift
//  NYCHighSchools
//
//  Created by Lawrence on 9/7/23.
//

import UIKit

class SchoolDetailViewController: UIViewController {
    
    let schoolDetailViewModel = SchoolDetailViewModel()


    
    @IBOutlet weak var writingCircularProgress: CircularProgressView!
    @IBOutlet weak var mathCircularProgress: CircularProgressView!
    @IBOutlet weak var readingCircularProgress: CircularProgressView!
    @IBOutlet weak var schoolDetailStack: UIStackView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var totalStudentsLabel: UILabel!
    @IBOutlet weak var schoolDescLabel: UILabel!
//    @IBOutlet weak var writingScoreLabel: UILabel!
//    @IBOutlet weak var mathScoreLabel: UILabel!
//    @IBOutlet weak var readingScoreLabel: UILabel!
    @IBOutlet weak var schoolNameLabel: UILabel!
    
    var school: HighSchool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBG()
        self.navigationController?.navigationBar.tintColor = UIColor(named: "White")
        
        schoolNameLabel.text = school?.schoolName
        
//        readingScoreLabel.text = school?.satCriticalReadingAvgScore
//        mathScoreLabel.text = school?.satMathAvgScore
//        writingScoreLabel.text = school?.satWritingAvgScore
        
        let readingScore = Int(school?.satCriticalReadingAvgScore ?? "0") ?? 0
        let mathScore = Int(school?.satMathAvgScore ?? "0") ?? 0
        let writingScore = Int(school?.satWritingAvgScore ?? "0") ?? 0
        
        readingCircularProgress.setprogress(Double(readingScore / 800),  "\(readingScore)")
        readingCircularProgress.animate(0.2)
        
        mathCircularProgress.setprogress(Double(mathScore / 800),  "\(mathScore)")
        mathCircularProgress.animate(0.2)
        
        writingCircularProgress.setprogress(Double(writingScore / 800),  "\(writingScore)")
        writingCircularProgress.animate(0.2)
        
        schoolDetailViewModel.getSchoolDetail(schoolID: school?.dbn) { result in
            
            switch result {
            case .success(let schoolDetail):
                DispatchQueue.main.async {
                    if let schoolDetail = schoolDetail {
                        self.schoolDescLabel.text = "   \(schoolDetail.overviewParagraph)"
                        self.totalStudentsLabel.text = schoolDetail.totalStudents
                        self.websiteLabel.text = schoolDetail.website
                        self.emailLabel.text = schoolDetail.schoolEmail
                        let address = "\(schoolDetail.primaryAddressLine1), \(schoolDetail.city), \(schoolDetail.stateCode), \(schoolDetail.zip)"
                        self.addressLabel.text = address
                    } else {
                        self.schoolDetailStack.isHidden = true
                    }
                    
                }
            case .failure(let failure):
                // handle error
                print(failure)
            }
        }

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
        layer1.zPosition = -1
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
        imageView.layer.zPosition = -1
        view.addSubview(imageView)
        
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
