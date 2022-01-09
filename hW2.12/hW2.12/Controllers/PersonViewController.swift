//
//  ViewController.swift
//  hW2.12
//
//  Created by Алексей Трофимов on 12.12.2021.
//

import UIKit

class PersonViewController: UIViewController {
    
    @IBOutlet var imageView:  ImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet var fullNameLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var familyLabel: UILabel!
    
    var character : UserModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        fullNameLabel.text = "Full Name: \(character.fullName ?? "")"
        titleLabel.text = "Title: \(character.title ?? "")"
        familyLabel.text = "Family: \(character.family ?? "")"
        fetchImage()
    }
    
    func fetchImage(){
//        DispatchQueue.global().async {
//        guard let stringURL = self.character.imageUrl else {return}
//        guard let imageURL = URL(string: stringURL) else {return}
//        guard let imageData = try? Data(contentsOf: imageURL) else {return}
//        DispatchQueue.main.async {
//            self.imageView.image = UIImage(data: imageData)
//            self.activityIndicator.stopAnimating()
//        }
//        }
        imageView.fetchImage(from: character.imageUrl)
    }
    
}
