import UIKit

class ContainerView: UIView {
    
    private enum CellIdentifier: String {
        case identifer = "DateCell"
    }
    
    let insets: CGFloat = 4
    
    let itemsPerRow: CGFloat = 7
    
    let minimumInterItemSpacing: CGFloat = 0.0
    
    lazy var collectionView: UICollectionView = {
        let layout = CustomFlowLayout()
        layout.scrollDirection = .vertical
       // layout.headerReferenceSize = CGSize(width: 10, height: 30)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        return collectionView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureView()
        configureCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        translatesAutoresizingMaskIntoConstraints = false
        //alpha = 0.5
        // backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        clipsToBounds = true
    }
    
    func configureCollectionView() {
        
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(DateViewCell.self, forCellWithReuseIdentifier: CellIdentifier.identifer.rawValue)
        
       // collectionView.register(DateCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderIdentifier")
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            
        ])
    }
    
    
}

extension ContainerView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.identifer.rawValue, for: indexPath) as? DateViewCell
        
        
        cell?.dateLabels.text = "\(indexPath.row + 1)"
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderIdentifier", for: indexPath) as? DateCollectionReusableView
        
        if indexPath.section == 0 {
            
            headerView?.setText(text: "Wow I did not know that")
            
            return headerView!
        }
        
        headerView?.setText(text: "\(indexPath.row)")
        
        return headerView!
        
        
    }
    
}

extension ContainerView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let availableWidth = ((self.frame.size.width - (2 * insets) - (minimumInterItemSpacing * (itemsPerRow - 1)))) / itemsPerRow
        
        return CGSize(width: availableWidth, height: availableWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: insets, left: insets, bottom: insets, right: insets)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumInterItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return minimumInterItemSpacing
    }
    
    
}
