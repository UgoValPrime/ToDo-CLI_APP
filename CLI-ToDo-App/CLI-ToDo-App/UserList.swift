//
//  UserList.swift
//  CLI-ToDo-App
//
//  Created by  Ugo  Val on 20/05/2022.
//

import Foundation


class UserList {
    
    static var toDoList: [ToDo] = []
    static var userInput = -1
    
    static func ViewUserList() {
        var x = 1
        while x != 0 {
            
            if toDoList.isEmpty {
                print("Your ToDo List is Empty Right Now!")
                print("1 \tTo Create Your First ToDo")
                print("9 \tTo Go Back To The Main Menu")
                print("0 \tTo End Program")
                
                switch Utils.readInt() {
                case 1:
                    CreateNewToDo()
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
                
            } else {
                for (i, todo) in toDoList.enumerated() {
                    var deadlineString: String?
                    if let date = todo.deadline {
                        deadlineString = formateDate(date)
                    }
                    print("\(i + 1).\t\(todo.title)\t\(todo.description)\t\(deadlineString ?? " ")\t\(todo.done ? "Done": "NotDone")")
                }
                
                print("\n")
                print("Above is Your List of Tasks")
                print("1 \tTo Do Some Operations On Your List")
                print("2 \tTo Add New ToDo")
                print("9 \tTo Go Back To The Main Menu")
                print("0 \tTo End Program")
                
                switch Utils.readInt() {
                case 1:
                    ToDo.OperationsOnToDo()
                case 2:
                    CreateNewToDo()
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
    }
    
    
    
    static func CreateNewToDo() {
        let currentTodo = ToDo(title: "", description: "", deadline: nil, done: false)
        print("\n")
        
        var x = 1
        while x == 1 {
            print("Enter Task Title (30 Letters): ", terminator: "")
            
            var currentTitle = currentTodo.title
            currentTitle = Utils.readString()
            
            if currentTitle.count <= 30 {
                currentTodo.title = currentTitle
                x = 0
                break
            } else {
                print("Title Length Shhould Be Less Than 30")
            }
        }
        
        
        x = 1
        while x == 1 {
            print("Enter Description (150 Letters): ", terminator: "")
            let currentDescription = Utils.readString()
            if currentDescription.count <= 150 {
                currentTodo.description = currentDescription
                x = 0
                break
            } else {
                print("Description Length Shhould Be Less Than 350")
            }
        }
        
        print("Enter Deadline in This Format dd-MM-yyyy")
        print("1 \tTo Skip")
        let currentDeadLine = Utils.readString()
        if let currentDeadlineDate = stringToDate(currentDeadLine) {
            x = 1
            while x == 1 {
                if currentDeadlineDate > Date() {
                    currentTodo.deadline = currentDeadlineDate
                    x = 0
                    break
                } else {
                    print("Deadline is From the Past!")
                    print("1 \tTo Save Anyway")
                    if Utils.readInt() == 1 {
                        currentTodo.deadline = currentDeadlineDate
                        x = 0
                        break
                    }
                }
            }
            
        } else {
            print("")
        }
        
        
        print("\n")
        print("Your Enterd ToDo is: \t\(currentTodo.title)\n\(currentTodo.description)\n\(currentTodo.deadline ?? Date())\n\(currentTodo.done ? "Done": "NotDone")")
        print("1 \tTo Save")
        print("2 \tTo Re-enter It")
        print("3 \tTo Cancel\n")
        
        switch Utils.readInt() {
        case 1:
            toDoList.append(currentTodo)
            ViewUserList()
        case 2:
            CreateNewToDo()
        case 3:
            break
        default:
            print("Invalid Input")
            break
        }
    }
    
    
    static func DeleteToDo(index: Int) {
        toDoList.remove(at: index - 1)
    }
}
