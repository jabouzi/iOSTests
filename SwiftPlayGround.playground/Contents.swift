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



