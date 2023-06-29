//
//  TitleCollectionViewCell.swift
//  NetflixCloneUIKit
//
//  Created by MM on 29.06.2023.
//

import UIKit
import SDWebImage

class TitleCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TitleCollectionViewCell"
    
    private let baseUrl: String = "https://image.tmdb.org/t/p/w500"
    
    let titleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)  // Вот тут вот не совсем понял, откого и куда я этот фрейме передаю?
        contentView.addSubview(titleImage)
    }
    
    override func layoutSubviews() { // а вот тут поподробнее что происходит? я же уже передал фрейм?
        super.layoutSubviews()
        titleImage.frame = contentView.bounds // что за контент вью? откуда у меня к нему берется доступ?
        // зачем мне вообще отдельно задавать фрейм, если я его передал до этого куда то всупервью
    }
    
    public func configurate(url: String) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500\(url)") else { return }
//        print(url)
        titleImage.sd_setImage(with: url)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
