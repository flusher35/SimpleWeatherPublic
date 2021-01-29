//
//  HiddenNavBarViewController.swift
//  SimpleWeather
//
//  Created by Anton Shevtsov on 28/01/2021.
//

import UIKit

class HiddenNavBarViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.setHidesBackButton(true, animated: false)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
