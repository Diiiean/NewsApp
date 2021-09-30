import UIKit
import Lottie
import Foundation

class LaunchViewController: UIViewController {
    let animationView = AnimationView()
    
    override func viewDidLoad() {
        setUpAnimation()        
    }
    override func viewDidAppear(_ animated: Bool) {
        let viewController = ViewController()
        let navViewController: UINavigationController = UINavigationController(rootViewController: viewController)
        navViewController.modalTransitionStyle = .crossDissolve
        navViewController.modalPresentationStyle = .fullScreen
        
        self.present(navViewController, animated: true, completion: nil)
    }
    
    private func setUpAnimation() {
        animationView.animation = Animation.named("news")
        animationView.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
        animationView.center = view.center
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        animationView.play()
        view.addSubview(animationView)
    }
}


