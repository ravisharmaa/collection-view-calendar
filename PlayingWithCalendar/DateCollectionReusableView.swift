import UIKit

class DateCollectionReusableView: UICollectionReusableView {
    
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure()  {
        addSubview(headerLabel)
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            headerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    
    func setText(text: String) {
        headerLabel.text = text
    }
    
    
}
