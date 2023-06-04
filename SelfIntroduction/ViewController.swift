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
    @IBOutlet weak var majorTextField: UITextField!
    @IBOutlet weak var hobbiesTextField: UITextField!
    
    @IBOutlet weak var yearSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var numberOfPetsLabel: UILabel!
    
    @IBOutlet weak var selfIntroButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        modeToggleButton.setTitle("Light Mode", for: .normal)
        
        let defaults = UserDefaults.standard
        let darkModeOn = defaults.bool(forKey: "darkModeOn")
        if darkModeOn {
            overrideUserInterfaceStyle = .dark
            modeToggleButton.setTitle("Light Mode", for: .normal)
        } else {
            overrideUserInterfaceStyle = .light
            modeToggleButton.setTitle("Dark Mode", for: .normal)
        }
        
        
        if let savedFirstName = defaults.string(forKey: "firstName") {
            firstNametextField.text = savedFirstName
        }
        
        if let savedLastName = defaults.string(forKey: "lastName") {
            lastNameTextField.text = savedLastName
        }
        
        if let savedSchoolName = defaults.string(forKey: "schoolName") {
            schoolNameTextField.text = savedSchoolName
        }
        
        if let savedMajor = defaults.string(forKey: "major") {
            majorTextField.text = savedMajor
        }
        
        if let savedHobbies = defaults.string(forKey: "hobbies") {
            hobbiesTextField.text = savedHobbies
        }
        
        let savedYear = defaults.integer(forKey: "schoolYear")
        
        yearSegmentedControl.selectedSegmentIndex = savedYear
        
        if let savedNumOfPets = defaults.string(forKey: "numOfPets") {
            numberOfPetsLabel.text = savedNumOfPets
        }
        
        
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        numberOfPetsLabel.text="\(Int(sender.value))"
    }
    
    
    @IBAction func introduceSelfButtonTapped(_ sender: UIButton) {
        let year = yearSegmentedControl.titleForSegment(at: yearSegmentedControl.selectedSegmentIndex)
                
        let introduction = "Hey, my name is \(firstNametextField.text!) \(lastNameTextField.text!) and I am attending \(schoolNameTextField.text!) ( ´ ▽ ` )ﾉ. \(majorTextField.text!) is my major and I like \(hobbiesTextField.text!). I am currently in my \(year!) year and I own \(numberOfPetsLabel.text!) pets. It is \(morePetsSwitch.isOn) that I want more cats (｡･ω･｡) 🐱🐱"

            
        let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)
            
        let action = UIAlertAction(title: "Nice to meet you!", style: .default, handler: nil)
            
        alertController.addAction(action)
            
        present(alertController, animated: true, completion: nil)
        
    }
    
    
    @IBOutlet weak var modeToggleButton: UIButton!
    @IBAction func modeToggleButtonTapped(_ sender: UIButton) {
        let defaults=UserDefaults.standard
        
        if overrideUserInterfaceStyle == .light{
            overrideUserInterfaceStyle = .dark
            modeToggleButton.setTitle("Light Mode", for: .normal)
        }else{
            overrideUserInterfaceStyle = .light
            modeToggleButton.setTitle("Dark Mode", for: .normal)
        }
    }
    

    @IBOutlet weak var saveMessageButton: UIButton!
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        let defaults=UserDefaults.standard
        defaults.set(firstNametextField.text, forKey: "firstName")
        defaults.set(lastNameTextField.text, forKey: "lastName")
        defaults.set(schoolNameTextField.text, forKey: "schoolName")
        defaults.set(majorTextField.text, forKey: "major")
        defaults.set(hobbiesTextField.text, forKey: "hobbies")
        defaults.set(yearSegmentedControl.selectedSegmentIndex, forKey: "schoolYear")
        defaults.set(numberOfPetsLabel.text, forKey: "numOfPets")
        
        let alertController=UIAlertController(title: "Success", message: "Saved", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Close", style: .default, handler: nil)
        
        alertController.addAction(action)
        present(alertController,animated: true,completion: nil)
        
    }
}

