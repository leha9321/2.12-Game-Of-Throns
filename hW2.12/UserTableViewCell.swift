//
//  UserTableViewCell.swift
//  hW2.12
//
//  Created by Алексей Трофимов on 12.12.2021.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var imageHero: UIImageView!
    @IBOutlet var firstName: UILabel!
    @IBOutlet var lastName: UILabel!
    
    func configure(with character: UserModel){
        firstName.text = character.firstName
        lastName.text = character.lastName
        DispatchQueue.global().async {
            
            guard let stringURL = character.imageUrl else {return}
            guard let imageURL = URL(string: stringURL) else {return}
            guard let imageData = try? Data(contentsOf: imageURL) else {return}
            DispatchQueue.main.async {
                self.imageHero.image = UIImage(data: imageData)
            }
        }
    }
    
}

