//
//  PhotoesController.swift
//  ImagesView
//
//  Created by Drolllted on 05.03.2024.
//

import UIKit

class PhotoesController: UIViewController {
    
    let images: [UIImage] = []
    
    private let imageViewZoom: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
    }
    
    public func changePhotoes(with image: UIImage){
        imageViewZoom.image = image
        setImagesView()
    }
    
    private func setImagesView() {
        view.addSubview(imageViewZoom)
        
        NSLayoutConstraint.activate([
            imageViewZoom.topAnchor.constraint(equalTo: view.topAnchor),
            imageViewZoom.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageViewZoom.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageViewZoom.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        ])
    }
}


