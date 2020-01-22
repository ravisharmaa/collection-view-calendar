import UIKit

class ViewController: UIViewController {
    
    private lazy var containerView: ContainerView = {
        let cv = ContainerView()
        return cv
    }()
    
    private lazy var movieHolderContainerView: MovieContainerView = {
        let movieContainer = MovieContainerView()
        return movieContainer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureContainerView()
        //configureMovieContainer()
    }
    
    func configureContainerView() {
        view.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            containerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/2)
        ])
    }
    
    func configureMovieContainer() {
        
        view.addSubview(movieHolderContainerView)
        
        NSLayoutConstraint.activate([
            movieHolderContainerView.topAnchor.constraint(equalTo: containerView.bottomAnchor),
            movieHolderContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            movieHolderContainerView.heightAnchor.constraint(equalTo: containerView.heightAnchor),
            movieHolderContainerView.widthAnchor.constraint(equalTo: containerView.widthAnchor)
        ])
    }
    
}


