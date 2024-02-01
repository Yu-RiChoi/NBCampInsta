//
//  GalleryCollectionView.swift
//  NBCampInsta
//
//  Created by 최유리 on 1/29/24.
//

import UIKit

class GalleryCollectionView: UICollectionView, UICollectionViewDelegate {
    
    private let pictures = [
        UIImage(named: "picture1"),
        UIImage(named: "picture2"),
        UIImage(named: "picture3"),
        UIImage(named: "picture4"),
        UIImage(named: "picture5"),
        UIImage(named: "picture6"),
        UIImage(named: "picture7")
    ]
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: UICollectionViewLayout())
        
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupCollectionView()
    }
    
    
    private func setupCollectionView() {
        let layout = createCompositionalLayout()
        self.collectionViewLayout = layout

        self.register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: GalleryCollectionViewCell.identifier)
        self.dataSource = self
        self.delegate = self
    }
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(124), heightDimension: .absolute(124))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}

extension GalleryCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(pictures.count)
        return pictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryCollectionViewCell.identifier, for: indexPath) as? GalleryCollectionViewCell 
        else {
            return UICollectionViewCell()
        }

        cell.imageView.image = self.pictures[indexPath.row]
        
        return cell
    }
}

