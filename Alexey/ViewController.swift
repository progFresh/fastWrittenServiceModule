//
//  ViewController.swift
//  Alexey
//
//  Created by Сергей Полозов on 22.01.2018.
//  Copyright © 2018 Sergey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets

    // MARK: - IBActions

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        var i = 1
        while (i<10) {
            let provider = NetworProvider(numberOfGame: i)
            provider.getGame(completion: { (result) in
                switch result {
                case .success(let game):
                    print(game.id)
                case .failure(_):
                    break
                }
            })
            i = i + 1
        }
    }
}
