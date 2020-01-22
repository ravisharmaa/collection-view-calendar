import UIKit

class CustomFlowLayout: UICollectionViewFlowLayout {
    
    override init() {
        super.init()
        register(SeparatorView.self, forDecorationViewOfKind: "SeparatorView")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAtrributes = super.layoutAttributesForElements(in: rect) ?? []
        let width = self.minimumLineSpacing
        
        var decorationAttributes: [UICollectionViewLayoutAttributes] = []
        
        for layoutAtrribute in layoutAtrributes where layoutAtrribute.indexPath.item > 0 {
            
            let separatorView = UICollectionViewLayoutAttributes(forDecorationViewOfKind: "SeparatorView", with: layoutAtrribute.indexPath)
            
            let cellFrame = layoutAtrribute.frame
            
            separatorView.frame = CGRect(x: cellFrame.origin.x,
                                         y: cellFrame.origin.y - width,
                                         width: cellFrame.size.width,
                                         height: width - 9)
            
            separatorView.zIndex = Int.max
            decorationAttributes.append(separatorView)
        }
        
        return layoutAtrributes + decorationAttributes
    }
    
    
}


private final class SeparatorView: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        self.frame = layoutAttributes.frame
    }
}
