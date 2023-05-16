//
//  HeroViewController.swift
//  APIDataInTableView
//
//  Created by Jon Salkin on 5/15/23.
//

import UIKit

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

class HeroViewController: UIViewController {

  //MARK: - IBOutlets
    @IBOutlet var heroImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var attributeLabel: UILabel!
    @IBOutlet var attackTypeLabel: UILabel!
    @IBOutlet var legsLabel: UILabel!
    
    
    //MARK: - Properties
    var hero: HeroStats?
    
    
    
  //MARK: - VDL
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = hero?.localized_name
        attributeLabel.text = hero?.primary_attr
        attackTypeLabel.text = hero?.attack_type
        legsLabel.text = "\((hero?.legs)!)"
        
        let imageUrl = "https://api.opendota.com" + (hero?.img)!
        
        heroImage.downloaded(from: imageUrl)
    }
    



}
