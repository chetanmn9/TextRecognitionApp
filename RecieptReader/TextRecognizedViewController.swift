//
//  TextRecognizedViewController.swift
//  RecieptReader
//
//  Created by Chetan Melkote nagaraj on 14/4/20.
//  Copyright © 2020 Chetan M Nagaraj. All rights reserved.
//

import UIKit

class TextRecognizedViewController: UIViewController {
    
    var textRecognize = [""]
    @IBOutlet weak var textDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for lines in textRecognize {
            textDisplay.text = textDisplay.text! + "\n" + lines
            
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        textRecognize = [""]
        
    }


}
