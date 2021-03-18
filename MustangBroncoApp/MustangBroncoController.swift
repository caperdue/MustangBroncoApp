//
//  MustangBroncoController.swift
//  MustangBroncoApp
//
//  Created by Carly Perdue on 3/17/21.
//

import UIKit

// Error to be thrown when user enters something invalid.
enum InputError: Error {
  case invalidEntry
}

class MustangBroncoController: UIViewController {
  
  // Get UI components
  @IBOutlet weak var headerView: UIView!
  @IBOutlet weak var inputTextField: UITextField!
  @IBOutlet weak var submitButton: UIButton!
  
  /**
   Handle when the submit button is pressed.
    
   - Parameter sender: button object that was pressed
   */
  @IBAction func submitPressed(_ sender: UIButton) {
    if let userInput = inputTextField.text {
      showAlertMessage(input: userInput)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Make the elements have a rounded background
    headerView.layer.cornerRadius = 10
    submitButton.layer.cornerRadius = 10
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    // When the user taps onto the screen, dismiss the keyboard.
    inputTextField.endEditing(true)
  }
  
  /**
   Displays a string value based on the input entered in the text field.
   
   # Message Display
   The message will be displayed based on if it is divisible by 3, 5, both 3 and 5, or not at all. A message is also displayed if the input is not a valid integer.
    * Divisble by 3 and 5: displays "MustangBronco"
    * Divisible by 3: displays "Mustang"
    * Divisible by 5: displays "Bronco"
    * Not divisible by 3 or 5: displays the integer
    * Not a valid integer: tell the user to enter a valid integer
   
   - Parameter input: Input entered by the user
   */
  func showAlertMessage(input: String) {
    var displayMessage: String
    
    do {
      // Check to see if the input can be casted as an integer
      let userNumber = try checkIfValidInt(input)
      
      // Get what message to display with the valid input
      displayMessage = getDisplayMessage(userNumber)
    }
    
    // Means the input is not a valid integer.
    catch {
      displayMessage = "Sorry, please enter a valid integer!"
    }

    // Declare alert to be shown to the user
    let alertMessage = UIAlertController(title: "Your message is:", message: displayMessage, preferredStyle: .alert)
    let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
    
    // Add the OK button to the alert 
    alertMessage.addAction(okButton)
    
    //Present alert message to user
    self.present(alertMessage, animated: true, completion: nil)
  }
  
  /**
   Check if the user input can be casted as a valid integer.
   
   - Parameter input: Input entered by the user
   - Returns: An integer representation of the input
   - Throws
      - `InputError.invalidEntry` if the input is invalid
   */
  func checkIfValidInt(_ input: String) throws -> Int {
    //Attempt to cast the input as an integer
    if let validInt = Int(input){
      return validInt
    }
    throw InputError.invalidEntry
  }
  
  /**
   Get the display message given a valid integer.
   
   - Parameter userNumber: Valid number entered by the user
   - Throws
      - `InputError.invalidEntry` if the input is invalid
   - Returns: A message of either Mustang, Bronco, MustangBronco, or the integer itself, based on input.
   
   */
  func getDisplayMessage(_ userNumber: Int) -> String {
    // Check user input to see what message to display
    if userNumber % 3 == 0 && userNumber % 5 == 0 {
      return "MustangBronco"
    }
    else if userNumber % 3 == 0 {
      return "Mustang"
    }
    else if userNumber % 5 == 0 {
      return "Bronco"
    }
    
    return String(userNumber)
  }
}

