//
//  ViewController.swift
//  hW2.12
//
//  Created by Алексей Трофимов on 12.12.2021.
//

import UIKit

class PersonViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    var character : UserModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        detailLabel.text = character.firstName
        fetchImage()
    }
    
    func fetchImage(){
        guard let stringURL = self.character.imageUrl else {return}
        guard let imageURL = URL(string: stringURL) else {return}
        guard let imageData = try? Data(contentsOf: imageURL) else {return}
        DispatchQueue.main.async {
            self.imageView.image = UIImage(data: imageData)
            self.activityIndicator.stopAnimating()
        }
    }
    
}
