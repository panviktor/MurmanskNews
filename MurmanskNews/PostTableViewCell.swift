//
//  PostTableViewCell.swift
//  MurmanskNews
//
//  Created by Viktor on 03.11.2020.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    //    override func prepareForReuse() {
    //        super.prepareForReuse()
    //
    //        configure(with: .none)
    //    }
    //
    //
    //
    //       override func awakeFromNib() {
    //           super.awakeFromNib()
    //        print(#line)
    //
    //       }
    //
    //    func configure(with post: Post?) {
    //        if let post = post {
    //            textLabel?.text = post.title
    //        } else {
    //            print("cell loading")
    //        }
    //    }
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print(#line)
        contentView.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
