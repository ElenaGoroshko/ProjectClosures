//
//  ViewController.swift
//  ProjectClosures
//
//  Created by Elena Goroshko on 11/28/17.
//  Copyright © 2017 Elena Goroshko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var printClosure = { print("I live Swift")}
    var calculateCircumference: (Double) -> Double = {
        radius in return 2 * Double(CGFloat.pi) * radius
    }
    var changeColorAction: ((UIColor) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        repeatTask(times: 10, task: printClosure)
        print(calculateCircumference(15.0))
        changeColorAction = { [unowned self] color in
            self.view.backgroundColor = color
        }
        changeColorAction?(.gray)
    }

    @IBAction func buttonTaped(_ sender: UIButton) {
        let color = sender.backgroundColor
        changeColorAction?(color!)
    }
    func repeatTask(times: Int, task: () -> Void) {
        for _ in 1...times {
            task()
        }
    }

}
