//
//  ParallaxVC.swift
//  ParallaxHeader
//
//  Created by Roman Sorochak on 6/27/17.
//  Copyright © 2017 MagicLab. All rights reserved.
//

import UIKit
import ParallaxHeader


class ParallaxVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    weak var headerImageView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.setClear()

        setupParallaxHeader()
    }
    
    
    //MARK: private
    
    private func setupParallaxHeader() {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile")
        imageView.contentMode = .scaleAspectFill
        
        headerImageView = imageView
        
        tableView.parallaxHeader.view = imageView
        tableView.parallaxHeader.height = 400
        tableView.parallaxHeader.minimumHeight = 64
        tableView.parallaxHeader.mode = .topFill
        tableView.parallaxHeader.parallaxHeaderDidScrollHandler = { parallaxHeader in
            print(parallaxHeader.progress)
        }
    }
    
    
    //MARK: table view data source/delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = "some row text"
        
        return cell
    }
}



extension UINavigationBar {
    func setClear() {
        isTranslucent = true
        shadowImage = UIImage()
        tintColor = UIColor.white
        barTintColor = UIColor.clear
        setBackgroundImage(UIImage(), for: .default)
    }
}
