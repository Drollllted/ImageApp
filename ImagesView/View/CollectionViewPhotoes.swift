//
//  ViewController.swift
//  ImagesView
//
//  Created by Drolllted on 02.03.2024.
//

import UIKit

enum ChangePicker{
    case photoes
    case camera
}

class CollectionViewPhotoes: UIViewController {
    
    var images: [UIImage] = []
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifire)
        collectionView.backgroundColor = .black
        
        return collectionView
    }()
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        for _ in 0...25{
            images.append(UIImage(named: "1")!)
            images.append(UIImage(named: "2")!)
            images.append(UIImage(named: "3")!)
            images.append(UIImage(named: "4")!)
        }
        
        
        
        setCollectionView()
        
        self.navigationItem.title = "Home"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.backgroundColor = .black
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: .add, style: .done, target: self, action: #selector(didTap))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: self, action: #selector(profileButton))
        
    }
    
  
    
    @objc func profileButton() {
        let vc = ProfileViewController()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func didTap() {
        let alertController = UIAlertController(title: "", message: "What do you think?", preferredStyle: .actionSheet)
        
        let alertButtonCamera = UIAlertAction(title: "Camera", style: .default) { _ in
            self.imagePicker.sourceType = .camera
            self.present(self.imagePicker, animated: true)
        }
        
        let alertButtonGallery = UIAlertAction(title: "Photo", style: .default) { _ in
            let image = self.imagePicker
            image.sourceType = .photoLibrary
            
            self.present(self.imagePicker, animated: true)
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .destructive) { _ in
            self.dismiss(animated: true)
        }
        alertController.addAction(alertButtonCamera)
        alertController.addAction(alertButtonGallery)
        alertController.addAction(cancelButton)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    private func setCollectionView() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    
    
}

extension CollectionViewPhotoes: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifire, for: indexPath) as? CustomCell else {fatalError("I am ")}
        cell.configure(with: images[indexPath.item])
        cell.layer.cornerRadius = 30
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = PhotoesController()
        vc.changePhotoes(with: images[indexPath.item])
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
extension CollectionViewPhotoes: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 400, height: 400)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
