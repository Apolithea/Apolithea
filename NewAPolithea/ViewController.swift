//
//  ViewController.swift
//  NewAPolithea
//
//  Created by Fabian Cooper on 4/15/20.
//  Copyright © 2020 Fabian Cooper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        LoginManager.shared.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        LoginManager.shared.login()
    }
    
    @IBAction func aboutButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "ToAboutVC", sender: nil)
    }
    


}

extension ViewController: LoginManagerDelegate {
    func loginManagerDidLoginWithSuccess() {
        UIApplication.shared.keyWindow?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TableViewNC")
        dismiss(animated: true, completion: nil)
    }
}

