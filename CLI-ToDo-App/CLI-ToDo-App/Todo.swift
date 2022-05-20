//
//  Todo.swift
//  CLI-ToDo-App
//
//  Created by  Ugo  Val on 20/05/2022.
//

import Foundation


class ToDo {
    
    var title: String
    var description: String
    var deadline: Date?
    var done: Bool = false
    
    init(title: String, description: String, deadline: Date?, done: Bool) {
        self.title = title
        self.description = description
        self.deadline = deadline
        self.done = done
    }
    
    static func SelectToDo(index: Int) -> ToDo {
        let currentToDo = UserList.toDoList[index - 1]
        return currentToDo
    }
    
    static func OperationsOnToDo() {
        
        print("Please Select a ToDo By Typing Its Index Number, Index Number is First Number From The Left in Single ToDo Row\n")
        let indx = Utils.readInt()
        let selectedToDo = SelectToDo(index: indx)
        
        print("Your Selected ToDo is\(selectedToDo)\n")
        print("1\t To Mark a ToDo As Done")
        print("2\t To Mark a ToDo As (Not) Done")
        print("3\t To Delete a ToDo")
        print("9\t To Go back to Main Menu")
        print("0\t To End The Program")
        print("\n\n")
        
        var x = 1
        while x != 0 {
            switch indx {
            case 1:
                //                MarkAsDone(index: indx)
                UserList.ViewUserList()
            case 2:
                MarkAsNotDone(index: indx)
                UserList.ViewUserList()
            case 3:
                UserList.DeleteToDo(index: indx)
                UserList.ViewUserList()
            case 9:
                x = 0
                break
            case 0:
                x = 0
                mainUserInput = 0
                break
            default:
                print("Invalid Input!")
            }
        }
    }
    
    
    static func MarkAsNotDone(index: Int) {
        let userInput = Utils.readInt()
        
        if UserList.toDoList[index - 1].done {
            UserList.toDoList[index - 1].done.toggle()
        } else {
            print("This ToDo is Already Marked As Done!\n")
            print("1 \tTo Back To Your ToDo List")
            print("9 \tTo Back To The Main Menu")
            print("0 \tTo Exit and Close The Program")
            print("\n")
            
            var x = 1
            while x != 0 {
                switch userInput {
                case 1:
                    UserList.ViewUserList()
                case 9:
                    x = 0
                    break
                case 0:
                    x = 0
                    mainUserInput = 0
                    break
                default:
                    print("Invalid Input")
                }
            }
        }
        print("\n")
        UserList.ViewUserList()
        print("Above is Your List of Tasks After Modification")
    }
}
