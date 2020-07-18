//
//  AboutTableViewCell.swift
//  TechMPOC
//
//  Created by Jegadeeswaran on 18/07/20.
//  Copyright © 2020 Jegadeeswaran. All rights reserved.
//

import UIKit

class AboutTableViewCell: UITableViewCell {

    let titleLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()

    let descriptionLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()

    let imgView: UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "down-arrow (6)"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(imgView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)

        imgView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 8.0, paddingLeft: 8.0, paddingBottom: 0.0, paddingRight: 0.0, width: 50.0, height: 50.0, enableInsets: false)
        titleLabel.anchor(top: topAnchor, left: imgView.rightAnchor, bottom: descriptionLabel.topAnchor, right: rightAnchor, paddingTop: 12.0, paddingLeft: 8.0, paddingBottom: 8.0, paddingRight: 8.0, width: 0, height: 0, enableInsets: false)
        descriptionLabel.anchor(top: nil, left: imgView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 8.0, paddingLeft: 8.0, paddingBottom: 8.0, paddingRight: 8.0, width: 0, height: 0, enableInsets: false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
