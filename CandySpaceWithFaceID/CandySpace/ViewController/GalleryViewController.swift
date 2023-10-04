//
//  GalleryViewController.swift
//  CandySpace
//
//  Created by Lawrence on 9/19/23.
//

import UIKit
import Combine

class GalleryViewController: UIViewController {
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var photoCollectionView: UICollectionView!
    private let galleryViewModel = GalleryViewModel(networkManager: NetworkManager(),
                                                    imageCache: ImageCache(), searchResultCache: SearchResultCache())
    private let itemsPerRow: CGFloat = 4
    var query: String?
    var anyCancelable: AnyCancellable?
    override func viewDidLoad() {
        super.viewDidLoad()
        styleSetting()
        anyCancelable = galleryViewModel.$state.receive(on: DispatchQueue.main).sink { state in
            switch state {
            case .loading:
                self.spinner.isHidden = false
                self.spinner.startAnimating()
            case .loaded:
                self.spinner.isHidden = true
                self.spinner.stopAnimating()
            case .error:
                self.spinner.isHidden = true
                self.throwAlert(title: "Oops!", errorMessage: "Something went wrong")
            }
        }
        // navigation title
        guard let query = query else { return }
        if query.isEmpty {
            navigationItem.title = "Gallery"
            throwAlert(title: "Oops!", errorMessage: "Please type somthing to search")
        } else {
            navigationItem.title = "Gallery for '\(query)'"
        }
        // photo collection data source and delegate
        photoCollectionView.dataSource = self
        photoCollectionView.delegate = self
        Task {
            query.isEmpty ? nil : try? await self.galleryViewModel.getImageGallery(searchTerm: query)
            DispatchQueue.main.async {
                self.photoCollectionView.reloadData()
            }
        }
    }
    func styleSetting() {
        // background image setting
        let imageView: UIImageView = {
            let imageView = UIImageView(frame: .zero)
            imageView.image = UIImage(named: "BG")
            imageView.contentMode = .scaleToFill
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        // gradient layer for background
        let gradientLayerForBG: CAGradientLayer = {
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [UIColor(red: 0, green: 0.008, blue: 0.063, alpha: 0).cgColor,
                                    UIColor(red: 0, green: 0.008, blue: 0.063, alpha: 1).cgColor]
            gradientLayer.locations = [0.0, 1.0]
            // Set the start and end points for the gradient layer
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
            return gradientLayer
        }()
        // blur effect
        let blurEffectViewForBG: UIVisualEffectView = {
            let blurEffect = UIBlurEffect(style: .systemUltraThinMaterial)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            return blurEffectView
        }()
        view.insertSubview(imageView, at: 0)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        // set background gradient layer
        gradientLayerForBG.frame = view.bounds
        // Add the gradient layer as a sublayer to the background view
        view.layer.insertSublayer(gradientLayerForBG, at: 1)
        // blur effect view for background
        blurEffectViewForBG.frame = view.bounds
        view.insertSubview(blurEffectViewForBG, at: 1)
    }
    func throwAlert(title: String, errorMessage: String) {
        let alert = UIAlertController(title: title, message: errorMessage, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel) { _ in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let photoViewController = segue.destination as? PhotoViewController
        // Get the index path from the cell that was tapped
        let indexPath = photoCollectionView.indexPathsForSelectedItems?.first
        guard let index = indexPath?.row else { return }
//        photoViewController?.photoTitle = galleryViewModel.images[index].tags
        photoViewController?.photoUrl = galleryViewModel.images[index].largeImageURL
    }
}

extension GalleryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleryViewModel.images.count
    }
    func collectionView(_
                        collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = photoCollectionView.dequeueReusableCell(
            withReuseIdentifier: "photoCollectionViewCell",
            for: indexPath
        ) as? PhotoCollectionViewCell
        guard let cell = cell else { return UICollectionViewCell() }
        guard let url = URL(string: galleryViewModel.images[indexPath.row].previewURL ?? "") else {
            return UICollectionViewCell()
        }
        Task {
            if let image = await galleryViewModel.getImage(url: url) {
                cell.photoImageView.image = image
            }
        }
        cell.backgroundColor = .black
        cell.layer.cornerRadius = 5
        return cell
    }
}

extension GalleryViewController: UICollectionViewDelegateFlowLayout {
      func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
      ) -> CGSize {
        let widthPerItem = view.frame.width / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
      }
      func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
      ) -> UIEdgeInsets {
          return UIEdgeInsets.zero
      }
      func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
      ) -> CGFloat {
        return 5
      }
}

extension GalleryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = photoCollectionView.cellForItem(at: indexPath)
        performSegue(withIdentifier: "toPhotoView", sender: item)
    }
}
