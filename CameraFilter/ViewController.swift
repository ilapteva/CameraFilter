//
//  ViewController.swift
//  CameraFilter
//
//  Created by Ира on 24.06.2020.
//  Copyright © 2020 Irina Lapteva. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let navC = segue.destination as? UINavigationController,
        let photosCVC = navC.viewControllers.first as? PhotoCollectionViewController else {
            fatalError("Segue destination is not found")
        }
        
        photosCVC.selectedPhoto.subscribe(onNext: { [weak self] photo in
    
            self?.photoImageView.image = photo
            
            }).disposed(by: disposeBag)
    }
}

