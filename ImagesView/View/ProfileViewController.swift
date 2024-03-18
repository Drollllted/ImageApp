//
//  ProfileViewController.swift
//  ImagesView
//
//  Created by Drolllted on 05.03.2024.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController{
    
    //MARK: UiModels
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        return scrollView
    }()
    
    private let profileImage: UIImageView = {
       let image = UIImageView()
        
        image.image = UIImage(named: "profile")
        
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 50
        
        image.heightAnchor.constraint(equalToConstant: 100).isActive = true
        image.widthAnchor.constraint(equalToConstant: 100).isActive = true
        return image
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name Nameis"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.widthAnchor.constraint(equalToConstant: 200).isActive = true
        return label
    }()
    
    private let idLabel: UILabel = {
        let label = UILabel()
        label.text = "@" + "Name"
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textColor = .gray
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 200).isActive = true
        return label
    }()
    
    private let discriprionLabel: UILabel = {
        let label = UILabel()
        label.text = "discriprions"
        label.numberOfLines = .max
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18, weight: .light)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let divider: UIView = {
        let rect = UIView()
        rect.backgroundColor = .systemGray3
        rect.layer.cornerRadius = 15
        rect.translatesAutoresizingMaskIntoConstraints = false
        
        rect.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        return rect
    }()
    
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        self.navigationItem.title = "Profile"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.backgroundColor = .black
        
        setUIModels()
    }
    

    //MARK: SetupUI
    
    private func setUIModels() {
        setProfileImage()
        
        setNameLabel()
        
        setIdLabel()
        
        setDiscriptionLabel()
        
        setRectangleView()
    }
    
    private func setProfileImage() {
        view.addSubview(profileImage)
        
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            profileImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
        ])
    }
    
    private func setNameLabel() {
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5)
        ])
    }
    
    private func setIdLabel() {
        view.addSubview(idLabel)
        
        NSLayoutConstraint.activate([
            idLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            idLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5)
        ])
    }
    
    private func setDiscriptionLabel() {
        view.addSubview(discriprionLabel)
        
        NSLayoutConstraint.activate([
            discriprionLabel.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 20),
            discriprionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5)
        ])
    }
    
    private func setRectangleView() {
        view.addSubview(divider)
        
        NSLayoutConstraint.activate([
            divider.topAnchor.constraint(equalTo: discriprionLabel.bottomAnchor, constant: 20),
            divider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 2),
            divider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 2)
        ])
    }
}
