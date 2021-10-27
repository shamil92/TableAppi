
import UIKit
import SnapKit
import Nuke


class UserCell: UITableViewCell {
    
    
    // MARK: - Properties
    
    private let imageimage = UIImageView()
    private let labelName = UILabel()
    private let titleLable = UILabel()
    
    var model: Datum?
    
    
    // MARK: - Life cycle
    
    override init(style:UITableViewCell.CellStyle, reuseIdentifier:String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(imageimage)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Drawing
    
    func configureView() {
        contentView.addSubview(titleLable)
        titleLable.numberOfLines = 0
        titleLable.adjustsFontSizeToFitWidth = true
        titleLable.font = .systemFont(ofSize: 20)
        
        contentView.addSubview(labelName)
        labelName.numberOfLines = 3
        labelName.adjustsFontSizeToFitWidth = true
        labelName.font = .systemFont(ofSize: 18)
        
        titleLable.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(10)
            maker.left.equalTo(imageimage).inset(90)
            maker.right.equalToSuperview().offset(-10)
        }
        
        labelName.snp.makeConstraints { maker in
            maker.top.equalTo(titleLable.snp.bottom).offset(10)
            maker.left.equalTo(imageimage).inset(90)
            maker.bottom.equalToSuperview().offset(-50)
            maker.right.equalToSuperview().inset(-10)
        }
        
        imageimage.layer.cornerRadius = 5
        imageimage.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(10)
            maker.left.equalToSuperview().inset(10)
            maker.width.height.equalTo(80)
            imageimage.clipsToBounds = true
        }
    }
}

    // MARK: - Configurable

extension UserCell:Configurable {
    struct Model {
        var datums: Datum
    }
    
    func configure(with datum: Model) {
        self.model = datum.datums
        print(datum)
        
        labelName.text = self.model?.company
        titleLable.text = self.model?.fio
        guard let url = URL(string: datum.datums.photo ?? "") else { return }
        Nuke.loadImage(with: url, into: imageimage)
        
    }
    
}

