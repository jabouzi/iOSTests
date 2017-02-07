//: Playground - noun: a place where people can play

import UIKit

let coordinates: (x: Int, y: Double, z: Int) = (5, 10.5, 11);
print(coordinates.x);

func print_something (param1: Int, with param2: Int, and param3: Double)
{
    print("Param1 \(param1) with Param2 \(param2) and Param3 \(param3)");
}

print_something(param1: 10, with: 55, and: 33.2);

var closureTest = { (a: Int, b: Int) -> Int in
    return a + b
}

let result = closureTest(4,3); print (result);

func testComplexFunction(a: Int, wiht b: Int, operation: (Int, Int) -> Int) -> Int {
    let result = operation(a, b);
    print(result);
    return result;
}

print(testComplexFunction(a: 22, wiht: 33, operation: closureTest));

var str: String?;
str = "Skander";
print(str);

let name = str!;
print(name);

if let name = str {
    print("OK");
} else {
    print("NO");
}

let arr = [Int]();
print(arr);

let arr1 = [1,2,3,4,5];
print(arr1);
print (arr1.index(of: 2));

print(arr.isEmpty);
print(arr1.count);

var arr2 = ["aa", "bb", "as", "sa", "az", "xw"];
print(arr2[2...4]);
print(arr2.contains("bc"));

arr2.append("zz");
print(arr2);
arr2 += ["éé"];
print(arr2);
arr2.insert("ff", at: 4);
print(arr2);

arr2.removeLast();
print(arr2);
arr2.remove(at: 2);
print(arr2);
print(arr2[3]);

for val in arr2 {
    print(val);
}

for(index, val) in arr2.enumerated() {
    print("\(index) : \(val)");
}


let arr3: [String] = [];
//let arr4 = [];
let arr5 = [Int]();

let dict: [Int: Int] = [:];
print(dict);

var myInofs = ["fname" : "Skander", "lname" : "Jabouzi"];
print(myInofs);
print(myInofs);

myInofs.updateValue("age", forKey: "42");
print(myInofs);

myInofs["height"] = "1.78m";
print(myInofs);

var setTest : Set = [1,2,34,1,2,3,1,23,4];
print(setTest);

var test = [[12:10], [11:23], [34:44]];
print(test[0].startIndex);

var _myInofs:NSArray = [["fname" : "Skander"], ["lname" : "Jabouzi"]];
let _index = _myInofs.index(of: ["fname" : "Skander"]);

var _guard = 10;

func testGuard(_guard: Int) {
    guard _guard > 20 else {
        print("GUARD");
        return;
    }
}

testGuard(_guard: _guard);


func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}

var currentValue = -4;

let moveNearZero = chooseStepFunction(backward: currentValue > 0);
print("\(currentValue)");

while currentValue != 0 {
    print("\(currentValue)");
    currentValue = moveNearZero(currentValue);
}

print("Zeo!");

func makeLogger() -> (String) -> String {
    func log(s: String) -> String {
        print("Log : \(s)");
        return s;
    }
    return log;
}

var myLog = makeLogger();
myLog("Test log");


let nums = [1,3,5,7];
func doubler(x: Int) -> Int {
    return x * 2;
}

let doubledNums = nums.map(doubler);
print(doubledNums);

let closureDoubledNums = nums.map({ (x: Int) -> Int in return x * 2 });
print(closureDoubledNums);

let closueDoubledNums2 = nums.map({ x in x * 2});
print(closueDoubledNums2);

let closueDoubledNums3 = nums.map({ $0 * 2});
print(closueDoubledNums2);

func jediBladeColor (colors: String...) -> () {
    for color in colors {
        print("\(color)")
    }
}
jediBladeColor(colors: "red","green");

func makeMultiplier(multiplier: Int) -> (Int) -> Int {
    return {
        $0 * multiplier;
    }
}

let doubler2 = makeMultiplier(multiplier: 2);
doubler2(10);
let tripler = makeMultiplier(multiplier: 3);
tripler(10);
nums.map(doubler2);
nums.map(tripler);

func makeLevelledLogger(level: String) -> (String) -> String {
    return {
        (message: String) -> String in
        let logMessage = "\(level) :: \(message)";
        print(logMessage);
        return(logMessage);
    }
}

let debug = makeLevelledLogger(level: "DEBUG");
let warning = makeLevelledLogger(level: "WARNING");
let message = makeLevelledLogger(level: "MESSAGE");

debug("A message from our debug logger");
warning("Consider yourself warned");
message("Life, the universe, and everything...");

func timesTenFunction(number: Int) -> Int {
    return number * 10;
}

let timesTenClosure: (Int) -> Int = { $0 * 10 }
timesTenFunction(number: 10);
timesTenClosure(10);
timesTenFunction(number: 20);
timesTenClosure(20);

func sum(from: Int, to: Int, closure: (Int) -> (Int)) -> Int {
    var sum = 0;
    for i in from...to {
        sum += closure(i)
    }
    
    return sum;
}
sum(from: 0, to: 10, closure: timesTenClosure);
sum(from: 0, to: 10, closure: timesTenFunction);
print(sum(from: 0, to: 10, closure: {$0 * 10}));
print(sum(from: 0, to: 10) { $0 * 10 }); // trailing closure


