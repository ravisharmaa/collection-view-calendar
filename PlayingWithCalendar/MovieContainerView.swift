import UIKit

class MovieContainerView: UIView {
    
    
    private let gradientLayer: CAGradientLayer = CAGradientLayer()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    private var results: [Result] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        configureCollectionView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        gradientLayer.frame = self.bounds
    }
    
    
    func configure() {
        let gradientBlack = UIColor(red: 15/255, green: 32/255, blue: 39/255, alpha: 1.0).cgColor
        let gradeintAnother = UIColor(red: 32/255, green: 58/255, blue: 67/255, alpha: 1.0).cgColor
        let another = UIColor(red: 44/255, green: 83/255, blue: 100/255, alpha: 1.0).cgColor
        gradientLayer.colors = [gradientBlack, gradeintAnother, another]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        gradientLayer.locations = [0.0,1.0,1.0]
        
        layer.addSublayer(gradientLayer)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureCollectionView() {
        
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        
        let apiUrl = URL(string: "https://api.themoviedb.org/3/search/movie?query=a&api_key=8d181bcb5e80a929053da01f6921e4a9")
        
        
        guard let url = apiUrl else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                return
            }
            
            guard let jsonData = data else {
                return
            }
            
            do {
                let object = try JSONDecoder().decode(Movie.self, from: jsonData)
                self.results = object.results
            
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
        
    }
}

extension MovieContainerView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuseId", for: indexPath) as? MovieCollectionViewCell
        
        cell?.setField(result: results[indexPath.item])
        
        return cell!
        
    }
    
    
}
