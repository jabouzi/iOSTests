//: Playground - noun: a place where people can play

import UIKit

struct _Professor
{
    var facultyID: String
    var name: String
    var phone: String
    var department: String
}

struct _Student
{
    var studentID: String
    var name: String
    var phone: String
    var major: String
}

func call(professor: _Professor)
{
    debugPrint("Calling professor \(professor.name) at \(professor.phone)")
}

func call(student: _Student)
{
    debugPrint("Calling student \(student.name) at \(student.phone)")
}

let _steve = _Professor(facultyID: "123", name: "Steve", phone: "123-456-7890", department: "English")
let _tim = _Student(studentID: "456", name: "Tim", phone: "987-654-3210", major: "Math")

call(student: _tim);
call(professor: _steve);

/////////// change structs to classes

class Person
{
    var name: String
    var phone: String
    
    init(name: String, phone: String)
    {
        self.name = name
        self.phone = phone
    }
}

class Professor: Person
{
    var facultyID: String
    var department: String
    
    init(facultyID: String, name: String, phone: String, department: String)
    {
        self.facultyID = facultyID
        self.department = department
        super.init(name: name, phone: phone)
    }
}

class Student: Person
{
    var studentID: String
    var major: String
    
    init(studentID: String, name: String, phone: String, major: String)
    {
        self.studentID = studentID
        self.major = major
        super.init(name: name, phone: phone)
    }
}

func call(person: Person)
{
    debugPrint("Calling \(person.phone)")
}


let steve = Professor(facultyID: "123", name: "Steve", phone: "123-456-7890", department: "English")
let tim = Student(studentID: "456", name: "Tim", phone: "987-654-3210", major: "Math")

call(person: steve);
call(person: tim);

////////////// move call function to person definition

///////////

class Person1
{
    var name: String
    var phone: String
    
    init(name: String, phone: String)
    {
        self.name = name
        self.phone = phone
    }
    
    func call(person: Person1)
    {
        debugPrint("Calling \(person.phone)")
    }
}

class Professor1: Person1
{
    var facultyID: String
    var department: String
    
    init(facultyID: String, name: String, phone: String, department: String)
    {
        self.facultyID = facultyID
        self.department = department
        super.init(name: name, phone: phone)
    }
}

class Student1: Person1
{
    var studentID: String
    var major: String
    
    init(studentID: String, name: String, phone: String, major: String)
    {
        self.studentID = studentID
        self.major = major
        super.init(name: name, phone: phone)
    }
}

let steve1 = Professor1(facultyID: "123", name: "Steve", phone: "123-456-7890", department: "English")
let tim1 = Student1(studentID: "456", name: "Tim", phone: "987-654-3210", major: "Math")

steve1.call(person: tim1)
tim1.call(person: steve1)

////// using protocols

protocol Callable
{
    var phone: String { get set }
    func call(callee: Callable)
}

struct Professor2: Callable
{
    var facultyID: String
    var name: String
    var phone: String
    var department: String
    
    func call(callee: Callable)
    {
        debugPrint("Calling \(callee.phone)")
    }
}

struct Student2: Callable
{
    var studentID: String
    var name: String
    var phone: String
    var major: String
    
    func call(callee: Callable)
    {
        debugPrint("Calling \(callee.phone)")
    }
}

let steve2 = Professor2(facultyID: "123", name: "Steve", phone: "123-456-7890", department: "English")
let tim2 = Student2(studentID: "456", name: "Tim", phone: "987-654-3210", major: "Math")

steve2.call(callee: tim2)
tim2.call(callee: steve2)

////// adding extension to protocol

protocol Callable3
{
    var phone: String { get set }
    func call(callee: Callable3)
}

extension Callable3
{
    func call(callee: Callable3)
    {
        debugPrint("Calling \(callee.phone)")
    }
}

struct Professor3: Callable3
{
    var facultyID: String
    var name: String
    var phone: String
    var department: String
}

struct Student3: Callable3
{
    var studentID: String
    var name: String
    var phone: String
    var major: String
}

let steve3 = Professor3(facultyID: "123", name: "Steve", phone: "123-456-7890", department: "English")
let tim3 = Student3(studentID: "456", name: "Tim", phone: "987-654-3210", major: "Math")

steve3.call(callee: tim3)
tim3.call(callee: steve3)










