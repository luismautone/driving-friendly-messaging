//
//  ViewController.swift
//  Driver-Friendly Messaging App
//
//  Created by Luis Mautone on 29/03/2020.
//  Copyright © 2020 Luis Mautone. All rights reserved.
//

import UIKit

let screenWidth  = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var picker: UIPickerView!
    var pickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.picker.delegate = self
        self.picker.dataSource = self
        
        pickerData = ["Luca: \"A dopo\"", "Dario: \"Va bene\"", "Luis: \"Ci sentiamo\"", "Paolo: ...", "Maria: ...", "Nicola: ..."]
        
        picker.isHidden = true;
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        tap.numberOfTapsRequired = 2
        view.addGestureRecognizer(tap)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func rowSize(_ pickerView: UIPickerView, forComponent component: Int) -> CGSize {
        return CGSize(width: screenWidth, height: screenHeight)
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat
    {
        return screenHeight / 3
    }
    
    @objc func doubleTapped() {
        picker.isHidden = false;
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }

}

