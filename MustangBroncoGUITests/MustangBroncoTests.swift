//
//  MustangBroncoTests.swift
//  MustangBroncoTests
//
//  Created by Carly Perdue on 3/17/21.
//

import XCTest
@testable import MustangBroncoGUI

class MustangBroncoTests: XCTestCase {
  
    var MustangVC:MustangBroncoController!
    
    override func setUp() {
      super.setUp()
      MustangVC = MustangBroncoController()
    }
  
   /**
   Test any invalid input where user entry cannot be casted as a valid integer.
   */
   func testInvalidEntryError() throws {
     XCTAssertThrowsError(try MustangVC.checkIfValidInt("hello"), "Error should be thrown here for having an invalid entry.")
     XCTAssertThrowsError(try MustangVC.checkIfValidInt(""), "Error should be thrown here for having an invalid entry.")
   }
  
   /**
   Test cases to check the output will be correct based on the integer provided.
   */
    func testValidInput() throws {
      XCTAssertEqual(MustangVC.getDisplayMessage(15), "MustangBronco")
      XCTAssertEqual(MustangVC.getDisplayMessage(25), "Bronco")
      XCTAssertEqual(MustangVC.getDisplayMessage(3), "Mustang")
      XCTAssertTrue(MustangVC.getDisplayMessage(19) == "19")
  }

}
