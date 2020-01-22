import UIKit

class DateViewCell: UICollectionViewCell {
    
    lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    
    lazy var dateLabels: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints  = false
        return label
    }()
    
    var showBackgroundView: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        
        containerView.alpha = 0.5
        containerView.layer.cornerRadius = 25
        
        addSubview(containerView)
        
        containerView.addSubview(dateLabels)
        
        dateLabels.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        NSLayoutConstraint.activate([
            containerView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            containerView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            dateLabels.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            dateLabels.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
        
    }
    
    
}
