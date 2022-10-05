//
//  ViewController.swift
//  SB-HW-2.10-Networking-API-JSON
//
//  Created by Sergey Nestroyniy on 05.10.2022.
//

import UIKit

class MainViewController: UICollectionViewController {
    
    private var somePeople : [ToolCartonData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchFromSite()
    }
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return somePeople.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as! MainCell
        
        let someHuman = somePeople[indexPath.item]
        cell.configure(with: someHuman)
        
        cell.tag = indexPath.item
        cell.layer.cornerRadius = 10
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "someHumanPressed", sender: collectionView.cellForItem(at: indexPath))
    }
    // MARK: Prepare Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "someHumanPressed" {
            guard let humanTVC = segue.destination as? HumanTableViewController else {return}
            humanTVC.human = somePeople[(sender as! MainCell).tag]
            humanTVC.avatarImage = (sender as! MainCell).cellImage.image
        }
    }
    
    // MARK: Private Methods
    private func successAlert() {
        let alert = UIAlertController(title: "Success",
                                      message: "You can see the results in the Debug aria",
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func failedAlert() {
        let alert = UIAlertController(title: "Failed",
                                      message: "You can see error in the Debug aria",
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


 // MARK: Networking - API - JSON
extension MainViewController {
    private func fetchFromSite() {
        guard let url = URL(string: ToolCartonData.url) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                self.somePeople = try JSONDecoder().decode([ToolCartonData].self, from: data)
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
//                    self.successAlert()
                }
            } catch let error {
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.failedAlert()
                }
            }
        }.resume()
    }
}

