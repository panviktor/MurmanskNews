//
//  PostTableViewCell.swift
//  MurmanskNews
//
//  Created by Viktor on 03.11.2020.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    private let screenSize: CGRect = UIScreen.main.bounds
    
    //MARK: - Layers
    //First layer
    let cardView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let firstStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .leading
        stackView.spacing = 2
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let ratingStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .leading
        stackView.spacing = 2
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let durationStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .leading
        stackView.spacing = 2
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    let mainImageView: WebImageView = {
        let imageView = WebImageView()
        imageView.contentMode =  .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let cityNameLabel: UILabel = {
        let label = UILabel()
        label.textColor =  #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .natural
        label.numberOfLines = 2
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    
    let bottonView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    let ratingImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "rating")
        return imageView
    }()
    
    let ratingLabel: UITextView = {
        let textView = UITextView()
        
        return textView
    }()
    
    let durationImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "duration")
        return imageView
    }()
    
    let durationLabel: UITextView = {
        let textView = UITextView()
        
        return textView
    }()
    
    override func prepareForReuse() {
        mainImageView.set(imageURL: nil)
    }
    
    //MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupFirstlayer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with post: Post) {
        mainImageView.set(imageURL: post.images?.first)
        titleLabel.text = post.title
        descriptionLabel.text = post.description
        cityNameLabel.text = "Мурманск"
        durationLabel.text = post.duration
        durationLabel.text = "\(post.rating ?? 0.0)"
    }
    
    private func setupFirstlayer() {
        contentView.addSubview(cardView)
        cardView.addSubview(mainImageView)
        cardView.addSubview(firstStackView)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            cardView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 5),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            cardView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
            mainImageView.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 1),
            mainImageView.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            mainImageView.widthAnchor.constraint(equalToConstant: screenSize.size.width * 0.98),
            mainImageView.heightAnchor.constraint(equalToConstant: screenSize.size.height / 3.5)
        ])
        
        NSLayoutConstraint.activate([
            firstStackView.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 5),
            firstStackView.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            firstStackView.widthAnchor.constraint(equalToConstant: screenSize.size.width * 0.98),
            firstStackView.heightAnchor.constraint(equalToConstant: screenSize.size.height / 4.5),
            firstStackView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -2),
        ])
        
        firstStackView.addArrangedSubview(cityNameLabel)
        firstStackView.addArrangedSubview(titleLabel)
        firstStackView.addArrangedSubview(bottonView)
        
        NSLayoutConstraint.activate([
            bottonView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
            bottonView.bottomAnchor.constraint(equalTo: firstStackView.bottomAnchor, constant: 0),
            bottonView.leftAnchor.constraint(equalTo: firstStackView.leftAnchor, constant: 0),
            bottonView.rightAnchor.constraint(equalTo: firstStackView.rightAnchor, constant: -1),
        ])
        
        bottonView.addSubview(ratingStackView)
        bottonView.addSubview(durationStackView)
        ratingStackView.addArrangedSubview(ratingImage)
        ratingStackView.addArrangedSubview(ratingLabel)
        durationStackView.addArrangedSubview(durationImage)
        durationStackView.addArrangedSubview(durationLabel)
        
        NSLayoutConstraint.activate([
            bottonView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
            bottonView.bottomAnchor.constraint(equalTo: firstStackView.bottomAnchor, constant: 0),
            bottonView.leftAnchor.constraint(equalTo: firstStackView.leftAnchor, constant: 0),
            bottonView.rightAnchor.constraint(equalTo: firstStackView.rightAnchor, constant: -1),
        ])
        
    }
}
