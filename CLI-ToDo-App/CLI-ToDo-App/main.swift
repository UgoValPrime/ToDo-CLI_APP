//
//  main.swift
//  CLI-ToDo-App
//
//  Created by  Ugo  Val on 20/05/2022.
//

import Foundation

public var mainUserInput: Int = -1
while (mainUserInput != 0) {
    
    print("\n\nWelcom to (Manage My Brain Program) \nPlease Type The Number That Corresponds To The Option You Want, And Then Click (Enter) From The Keyboard to Continue. \n")
    print("1 \t To View Your ToDo List")
    print("2 \t To Add a New ToDo")
    print("0 \t To Exit & Close The Program")
    print("Note: If You Want to Run The program Again, Just Use The Shortcut (command+R) From The Keyboard \n")
    
    let userInputSelection = Utils.readInt()
    
    switch userInputSelection {
    case 1:
        UserList.ViewUserList()
        print("\n")
    case 2:
        UserList.CreateNewToDo()
    case 0:
        mainUserInput = 0
    default:
        print("Error Message: Invalid Input, Please Enter (1) To View Your List of Tasks, Or (2) to Create a New ToDo, Or (0) To Close and Exit the Program")
    }
}
