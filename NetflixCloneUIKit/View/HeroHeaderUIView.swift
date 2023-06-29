//
//  HeroHeaderUIView.swift
//  NetflixCloneUIKit
//
//  Created by MM on 27.06.2023.
//

import UIKit

class HeroHeaderUIView: UIView {
    
    private let playButton: UIButton = {
       let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemBackground.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false // а что вот это значит поподробнее? типо я говорю, что констрейны для этого элемента будут добавлены отдельно?
        return button
    }()
    
    private let downloadButton: UIButton = {
        let db = UIButton()
        db.setTitle("Download", for: .normal)
        db.layer.borderWidth = 1
        db.layer.borderColor = UIColor.systemBackground.cgColor
        db.translatesAutoresizingMaskIntoConstraints = false
        return db
    }()
    
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill // как сделать алаймент по верхнему краю картинки?
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "hhxxhh")
        return imageView
    }() // а чем такой инициализатор отличается? это считается калькулейтед свойством или нет? Что то меня тут переодически подъёбывет
    

    override init(frame: CGRect) {
        super.init(frame: frame) // Тут он обращается автоматически к классу, который его вызвал и берёт у него границы? Bounds берет или frame?
        addSubview(heroImageView)
        addGradient()
        addSubview(playButton)
        addSubview(downloadButton)
        applyConstrain()
    }
    
    private func applyConstrain() {
        
        let downloadButtonConstrains = [
            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -70),
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            downloadButton.widthAnchor.constraint(equalToConstant: 120)
        ]
        
        let playButtonConstrains = [
            playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            playButton.widthAnchor.constraint(equalToConstant: 120)
        ]
        
        NSLayoutConstraint.activate(downloadButtonConstrains) // а вот это я куда обращаюсь? кто такая nslayoutconstrains?
        NSLayoutConstraint.activate(playButtonConstrains)
    }
  
    func addGradient() {
        let gradientLayer = CAGradientLayer() // Что значит CA? Что за библиотека? Почему лэйер а не сам градиент?
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.systemBackground.cgColor]
        gradientLayer.frame = bounds // вот почему без этого не показывает?
        layer.addSublayer(gradientLayer) // Это ещё откуда лэйер берётся к которому я обращаюсь?
    }
    
    override func layoutSubviews() { // Вот тут поподробнее, что она делает?
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    }

