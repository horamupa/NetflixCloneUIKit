//
//  CollectionViewTableViewCell.swift
//  NetflixCloneUIKit
//
//  Created by MM on 27.06.2023.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {
    
    static let identifier = "CollectionViewTableViewCell"
    var titles: [Title] = []
    
    // create scrollView inside table row cell
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 140, height: 200) // почему вот тут она задала итем сайз и стали в ряд, а не большими в несколько рядом?
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier: "TitleCollectionViewCell")
        
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemMint
        contentView.addSubview(collectionView)
        collectionView.delegate = self // Вот это что?
        collectionView.dataSource = self // Вот это что?
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds // Что к чему тут приравнивается?
    }
    
    public func config(with item: [Title]) {
        self.titles = item
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
        
    }
}

// adding methods for UICollectionVie
extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // Number of items in hCollection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        titles.count
    }
    
    // Item in H-collection looks like
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell { // что за индекс пас?
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "TitleCollectionViewCell", for: indexPath
        ) as? TitleCollectionViewCell
        else { return UICollectionViewCell()}
        guard let model = titles[indexPath.row].poster_path else { return UICollectionViewCell() }
        cell.configurate(url: model)
//        cell.backgroundColor = .green
        return cell
        
    }
    
    
    
}
