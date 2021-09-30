//
//  ViewController.swift
//  NewsApp
//
//  Created by Диана Нуансенгси on 29.09.2021.
//


import UIKit
import Lottie
import Foundation


class LaunchViewController: UIViewController {
  let animationView = AnimationView()
    
    override func viewDidLoad() {
        
        setUpAnimation()
    }
    override func viewDidDisappear(_ animated: Bool) {
        let viewController = ViewController()
        viewController.modalTransitionStyle = .crossDissolve
        viewController.modalPresentationStyle = .fullScreen
        present(viewController, animated: true)
    }
    private func setUpAnimation() {
        print("Launch screen nnnnnnnnnnnn")
        animationView.animation = Animation.named("news")
        animationView.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
        animationView.center = view.center
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        animationView.play()
        view.addSubview(animationView)
        //viewDidDisappear(true)
        
    }
}




//private let imageView: UIImageView = {
//    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 120, height: 120))
//    imageView.image = UIImage(named: "")
//    return imageView
//}()
//override func viewDidLoad() {
//    super.viewDidLoad()
//    view.addSubview(imageView)
//}
//override func viewDidLayoutSubviews() {
//    super.viewDidLayoutSubviews()
//    imageView.center = view.center
//    animate()
//}
//private func animate() {
//
//}
