//
//  SecondViewController.swift
//  TableAppi
//
//  Created by Шамиль Каммаев on 12.05.2021.
//

import UIKit
import SnapKit
import Nuke


final class SecondScreenViewController: UIViewController {
    
    
    // MARK: - Properties
    
    var presenter: DetailViewPresenterProtocol?
    var model: Datum?
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Выход", for: .normal)
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(cancelSecondView), for: .touchUpInside)
        button.backgroundColor = .gray
        return button
        
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 8
        return view
    }()
    
    private lazy var postLabel:UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.black
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
        
    }()
    
    private lazy var companyLabel:UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.black
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    private lazy var vieWLabel:UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.black
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private lazy var activityLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.black
        lbl.numberOfLines = 0
        lbl.adjustsFontSizeToFitWidth = true
        return lbl
    }()
    
    private var viewNew: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.yellow
        return view
    }()
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        presenter?.setDatum()
        view.backgroundColor = .lightGray
    }
    
    
    // MARK: - Drawing
    
    func configView() {
        view.addSubview(cancelButton)
        cancelButton.snp.makeConstraints {
            $0.width.equalTo(60)
            $0.height.equalTo(40)
            $0.left.equalToSuperview().inset(15)
            $0.top.equalToSuperview().offset(50)
        }
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.top.equalTo(cancelButton).inset(50)
            $0.leading.equalToSuperview().offset(25)
            $0.trailing.equalToSuperview().offset(-25)
            $0.height.equalTo(300)
            $0.width.equalTo(200)
        }
        
        view.addSubview(postLabel)
        postLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
        
        view.addSubview(companyLabel)
        companyLabel.snp.makeConstraints {
            $0.top.equalTo(postLabel.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
        
        view.addSubview(activityLabel)
        activityLabel.snp.makeConstraints {
            $0.top.equalTo(companyLabel.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
        
        view.addSubview(viewNew)
        viewNew.snp.makeConstraints {
            $0.top.equalTo(activityLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(190)
        }
        
        viewNew.addSubview(vieWLabel)
        vieWLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().inset(10)
            $0.top.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview()
        }
    }
    
    
    // MARK:Actions
    
    @objc private func cancelSecondView() {
        presenter?.dismissSecondView()
    }
    
    
}
extension SecondScreenViewController: DetailViewProtocol {
    func setDatum(datum: Datum?) {
        postLabel.text = datum?.post
        companyLabel.text = datum?.company
        activityLabel.text = datum?.activity
        guard let url = URL(string: datum?.photo ?? "") else { return }
        Nuke.loadImage(with: url, into: imageView)
        viewNew.snp.makeConstraints {
            $0.height.equalTo(vieWLabel.snp.height)
        }
    }
}



    
    
    
    

