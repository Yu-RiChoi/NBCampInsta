//
//  TaskCollectionView.swift
//  NBCampInsta
//
//  Created by 최유리 on 1/31/24.
//

import UIKit

class TaskCollectionView: UICollectionView, UICollectionViewDelegate {
    
    private let taskList: [TaskModel] = []
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: UICollectionViewLayout())
        self.backgroundColor = .blue
        
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        let layout = createCompositionalLayout()
        self.collectionViewLayout = layout

        self.register(TaskCollectionViewCell.self, forCellWithReuseIdentifier: TaskCollectionViewCell.identifier)
        self.delegate = self
    }
    
    private func createCompositionalLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(240))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
    
}

extension TaskCollectionView {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return taskList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TaskCollectionViewCell.identifier, for: indexPath) as? TaskCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }
}


