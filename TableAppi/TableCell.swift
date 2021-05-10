//
//  TableViewCell.swift
//  TableAppi
//
//  Created by Шамиль Каммаев on 06.05.2021.
//

import UIKit
import SnapKit





class TableCell: UITableViewCell {
    
    
    var imageimage = UIView()
    var labelName = UILabel()
    var titleLable = UILabel()
    
    
    
    override init(style:UITableViewCell.CellStyle, reuseIdentifier:String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        contentView.addSubview(titleLable)
        contentView.addSubview(labelName)
//        addSubview(imageimage)
        
        

        configureTitleLable()
        configureLabelName()
//        configureImageView()
        setTitleLabelConstraints()
        setLabelNameConstraints()
//        setImageViewConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureTitleLable() {
        titleLable.numberOfLines = 0
        titleLable.adjustsFontSizeToFitWidth = true
        titleLable.font = .systemFont(ofSize: 20)
    }
    
    func configureImageView() {
        
        imageimage.backgroundColor = UIColor.blue
        imageimage.clipsToBounds = true
        
    }
    
    func configureLabelName() {
        labelName.numberOfLines = 3
//        labelName.adjustsFontSizeToFitWidth = true
        labelName.font = .systemFont(ofSize: 18)
    }
    
    func setTitleLabelConstraints() {
        
        titleLable.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(10)
            maker.left.equalToSuperview().offset(10)
            maker.right.equalToSuperview().offset(-10)
        }
    }
    
    func setLabelNameConstraints() {
    
        labelName.snp.makeConstraints { maker in
            maker.top.equalTo(titleLable.snp.bottom).offset(10)
            maker.left.equalToSuperview().offset(10)
            maker.bottom.equalToSuperview().offset(-50)
            maker.right.equalToSuperview().inset(-10)
        }
        
        
    }
    
    
    func setImageViewConstraints() {
        imageimage.snp.makeConstraints { maker in
            
            maker.top.equalToSuperview().inset(10)
            maker.left.equalToSuperview().inset(10)
            maker.width.height.equalTo(80)
        }
        
        
    }
    
    
}
    
    

