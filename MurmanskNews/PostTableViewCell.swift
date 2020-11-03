//
//  PostTableViewCell.swift
//  MurmanskNews
//
//  Created by Viktor on 03.11.2020.
//

import UIKit

class PostTableViewCell: UITableViewCell {
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
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.spacing = 2
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let mainImageView: WebImageView = {
        let imageView = WebImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
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
    
    let cityNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    let ratingImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "eye")
        return imageView
    }()
    
    let ratingLabel: UITextView = {
        let textView = UITextView()
        
        return textView
    }()
    
    
    
    let durationImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "eye")
        return imageView
    }()
    
    let durationLabel: UITextView = {
        let textView = UITextView()
        
        return textView
    }()
    
    
    
    override func prepareForReuse() {
        //        mainImageView.set(imageURL: nil)
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
        cardView.addSubview(firstStackView)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(
            equalTo: contentView.topAnchor,
            constant: 0),
            cardView.rightAnchor.constraint(
            equalTo: contentView.rightAnchor,
            constant: 0),
            cardView.bottomAnchor.constraint(
            equalTo: contentView.bottomAnchor,
            constant: 0),
            cardView.leftAnchor.constraint(
            equalTo: contentView.leftAnchor,
            constant: 0)
      ])

        NSLayoutConstraint.activate([
            firstStackView.topAnchor.constraint(
            equalTo: cardView.topAnchor,
            constant: 2),
            firstStackView.rightAnchor.constraint(
            equalTo: cardView.rightAnchor,
            constant: -2),
            firstStackView.bottomAnchor.constraint(
            equalTo: cardView.bottomAnchor,
            constant: -2),
            firstStackView.leftAnchor.constraint(
            equalTo: cardView.leftAnchor,
            constant: 2)
      ])
        
        firstStackView.addArrangedSubview(cityNameLabel)
        firstStackView.addArrangedSubview(titleLabel)
        firstStackView.addArrangedSubview(descriptionLabel)
       
    }
}

class WebImageView: UIImageView {
    private var currentUrlString: String?
    
    func set(imageURL: String?) {
        
        currentUrlString = imageURL
        
        guard let imageURL = imageURL, let url = URL(string: imageURL) else {
            self.image = nil
            return
        }
        
        if let cachedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            self.image = UIImage(data: cachedResponse.data)
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            DispatchQueue.main.async {
                if let data = data, let response = response {
                    
                    self?.handleLoadedImage(data: data, response: response)
                }
            }
        }
        dataTask.resume()
    }
    
    private func handleLoadedImage(data: Data, response: URLResponse) {
        guard let responseURL = response.url else { return }
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: responseURL))
        
        if responseURL.absoluteString == currentUrlString {
            self.image = UIImage(data: data)
        }
    }
}
