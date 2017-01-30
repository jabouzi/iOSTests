//: Playground - noun: a place where people can play

import UIKit

class Person {
    
    var firstName : String;
    var lastName : String;
    weak var friend: Person?;
    
    init(firstName: String, lastName: String) {
        
        self.firstName = firstName;
        self.lastName = lastName;
        
    }
    
   
    deinit
    {
        print("\(firstName) \(lastName) being deallocated");
    }
    
    func getFullName() -> String {
        
        return "\(self.firstName) \(self.lastName)";
        
    }
}

var me : Person = Person(firstName: "Skander", lastName: "Jabouzi");
me.getFullName();
me.firstName = "Papa";
me.getFullName();

let him : Person = me;
him.lastName = "Toto";

him.getFullName();
me.getFullName();

print (him === me);

var group : [Person] = [Person(firstName: "Kaka", lastName: "Kiki"), him, me, Person(firstName: "George", lastName: "Bush"), Person(firstName: "Diego", lastName: "Maradonne")];
print(group);

print(group.contains(where: {$0 === me}));

struct Grade {
    let letter: String;
    let points: Double;
    let credit: Double;
}

class Student: Person {
    
    var field: String = "N/A";
    var grades = [Grade](); //[Grade] = [];
    
    func printSpeciality() -> String {
        return ("\(getFullName()) is an student in \(field)");
    }
}

let john = Person(firstName: "John", lastName: "McKane");
let harry = Student(firstName: "Harry", lastName: "Potter");

class StudentAthlete: Student {

    var sport: String = "N/A";
    
    init(firstName: String, lastName: String, sport: String) {
        self.sport = sport;
        super.init(firstName: firstName, lastName: lastName);
    }
    
    override func printSpeciality() -> String {
        return ("\(super.printSpeciality()) and \(sport)");
    }

}
class StarStudentAthlete: StudentAthlete {}

func phoneBookName(person: Person) -> String {
    
    return "\(person.firstName) \(person.lastName)";
    
}

let person = Person(firstName: "Balha", lastName: "Toutou");
let star = StarStudentAthlete(firstName: "Carl", lastName: "Louis", sport: "Soccer");

print(phoneBookName(person: person));
print(phoneBookName(person: star));

print(star.printSpeciality());

var _person : Person? = Person(firstName: "Alex", lastName: "Gonzales");
var _me : Person? = Person(firstName: "Skander", lastName: "Jabouzi");

_me?.friend = _person;
_person?.friend = me;

_person = nil;
_me = nil;

//me.setFirstName("skander");


enum Month: Int {
    case January = 1, February, March, April, May, June, July, August, September, October, November, December
}

func schoolSemester(month: Month) -> String {
    switch month {
    case .August, .September, .October, .November, .December:
        return "Automn";
    case .January, .February, .March, .April, .May:
        return "Spring";
    default:
        return "Vacation";
    }
}

var month: Month = .April;
print(schoolSemester(month: month));
print(Month.April.hashValue);
print(Month.April.rawValue);

struct Date {
    var month: Month;
    var day: Int;
    
    init() {
        month = .January;
        day = 1;
    }
    
    mutating func advance() {
        day += 1;
    }
}

protocol Vehicule {
    func accelerate()
    func stop()
}

protocol WheeledVehicule: Vehicule {
    var numberOfWheels: Int { get}
    var wheelSize: Double { get set }
}

class Bike: WheeledVehicule {
    
    func stop() {
        print("Stop");
    }

    
    func accelerate() {
        print("Accelerate");
    }

    var numberOfWheels: Int = 2
    var wheelSize: Double = 16.0
}




