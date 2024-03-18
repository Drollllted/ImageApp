//
//  CustomCell.swift
//  ImagesView
//
//  Created by Drolllted on 02.03.2024.
//

import UIKit

class CustomCell: UICollectionViewCell{
    
    static let identifire = "identifire"
    
   private var selectBool: Bool = false
    
    private let imagesView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "questionmark")
        imageView.layer.cornerRadius = 30
        return imageView
    }()
    
    private var heartButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        button.tintColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    public func configure(with image: UIImage){
        imagesView.image = image
        setImagesView()
        setHeartButton()
    }
    
    
    private func setImagesView() {
        self.addSubview(imagesView)
        
        NSLayoutConstraint.activate([
            imagesView.topAnchor.constraint(equalTo: self.topAnchor),
            imagesView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imagesView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imagesView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    private func setHeartButton() {
        self.addSubview(heartButton)
        
        NSLayoutConstraint.activate([
            heartButton.topAnchor.constraint(equalTo: imagesView.topAnchor, constant: 15),
            heartButton.trailingAnchor.constraint(equalTo: imagesView.trailingAnchor, constant: -15)
        ])
    }
}
