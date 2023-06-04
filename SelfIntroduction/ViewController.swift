//
//  ViewController.swift
//  SelfIntroduction
//
//  Created by YANWEN CHEN on 6/2/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var morePetsSwitch: UISwitch!
    
    @IBOutlet weak var morePetsStepper: UIStepper!
    
    @IBOutlet weak var firstNametextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var schoolNameTextField: UITextField!
    
    @IBOutlet weak var yearSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var numberOfPetsLabel: UILabel!
    
    @IBOutlet weak var selfIntroButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        modeToggleButton.setTitle("Light Mode", for: .normal)
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        numberOfPetsLabel.text="\(Int(sender.value))"
    }
    
    
    @IBAction func introduceSelfButtonTapped(_ sender: UIButton) {
        let year = yearSegmentedControl.titleForSegment(at: yearSegmentedControl.selectedSegmentIndex)
                
        let introduction = "Hey, my name is \(firstNametextField.text!) \(lastNameTextField.text!) and I am attending \(schoolNameTextField.text!) ( ´ ▽ ` )ﾉ. I am currently in my \(year!) year and I own \(numberOfPetsLabel.text!) pets. It is \(morePetsSwitch.isOn) that I want more cats (｡･ω･｡) 🐱🐱"
            
        let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)
            
        let action = UIAlertAction(title: "Nice to meet you!", style: .default, handler: nil)
            
        alertController.addAction(action)
            
        present(alertController, animated: true, completion: nil)
        
    }
    
    
    @IBOutlet weak var modeToggleButton: UIButton!
    
    @IBAction func modeToggleButtonTapped(_ sender: UIButton) {
        if overrideUserInterfaceStyle == .light{
            overrideUserInterfaceStyle = .dark
            modeToggleButton.setTitle("Light Mode", for: .normal)
        }else{
            overrideUserInterfaceStyle = .light
            modeToggleButton.setTitle("Dark Mode", for: .normal)
        }
    }
    

    
}

