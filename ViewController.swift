//
//  ViewController.swift
//  compositionalLayout
//
//  Created by Serhat Akalin on 14.06.2019.
//  Copyright © 2019 Serhat Akalin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colView: UICollectionView!
    let colors = [UIColor.red, UIColor.blue, UIColor.green, UIColor.orange, UIColor.yellow, UIColor.purple, ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colView.register(CompoCell.self, forCellWithReuseIdentifier: "CompoCell")
        colView.contentInsetAdjustmentBehavior = .scrollableAxes
        colView.collectionViewLayout = makeLayout()
    }

    func makeLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (section: Int, environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: NSCollectionLayoutDimension.fractionalWidth(1.0), heightDimension: NSCollectionLayoutDimension.absolute(44)))
            item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.5),  heightDimension: .absolute(50))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            return section
        }
        return layout
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
}
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CompoCell", for: indexPath) as! CompoCell
        cell.container.backgroundColor = colors[indexPath.row]
        return cell
    }
    
}



