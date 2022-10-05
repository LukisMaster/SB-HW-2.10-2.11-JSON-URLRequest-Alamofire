//
//  MainVCCell.swift
//  SB-HW-2.10-Networking-API-JSON
//
//  Created by Sergey Nestroyniy on 05.10.2022.
//

import UIKit

class MainCell: UICollectionViewCell {
    @IBOutlet var cellImage : UIImageView!
    @IBOutlet var cellLabel : UILabel!
    
    
    func configure(with human: ToolCartonData) {
        cellLabel.text = """
    \(human.name)
    rating: \(String(format: "%.01f", human.rating))
"""
        
        DispatchQueue.global().async {
            guard let stringUrl = human.avatar,
                  let imageURL = URL(string: stringUrl),
                  let imageData = try? Data(contentsOf: imageURL) else {
                return
            }
            
            DispatchQueue.main.async {
                self.cellImage.image = UIImage(data: imageData)
            }
        }
        
    }
    
}
