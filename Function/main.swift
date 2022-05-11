//
//  main.swift
//  Function
//
//  Created by 이준영 on 2022/05/10.
//

import Foundation

//MARK: - 함수
/*
 스위프트의 함수는 재정의(오버라이드)와 중복 정의(오버로드)를 모두 지원합니다. 따라서 매개변수의 타입이 다르면 같은 이름의 함수를 여러 개 만들 수 있고,
 매개변수의 개수가 달라도 같은 이름의 함수를 만들 수 있습니다. 그렇기 때문에 같은 이름의 함수를 구현해도 오류가 발생하지 않습니다.
 
 func 함수 이름(매개변수...) -> 반환 타입 {
    실행구문
    return 반환 값
 }
 */
print("========== (function) ==========")

//MARK: 기본 형태의 함수 정의와 사용
func hello(name: String) -> String {
    return "Hello \(name)"
}
print(hello(name: "junlight"));

//MARK: - 매개 변수가 없는 함수
func helloWorld() -> String {
    return "Hello, world"
}
print(helloWorld())

//MARK: - 매개 변수가 여러 개인 함수
func sayHello(myName: String, yourName: String) -> String {
    return "Hello \(yourName)! I'm \(myName)"
}
print(sayHello(myName: "junlight", yourName: "chulsoo"))

//MARK: 전달인자 레이블을 가지는 함수
func sayHello(from myName: String, to yourName: String) -> String{
    return "Hello \(yourName)! I'm \(myName)"
}
print(sayHello(from: "junlight", to: "jenny"))

//MARK: - 와일드카드 사용 전달인자 레이블이 없는 함수
func sayHello (_ name: String, _ times: Int) -> String{
    var result = ""
    
    for _ in 0..<times {
        result += "Hello \(name)" + " "
    }
    
    return result
}
print(sayHello("junlight", 5))

//MARK: - 가변 매개변수를 가지는 함수
func sayHelloToFriend(me: String, friends names: String...) -> String{
    var result: String = ""
    
    for friend in names {
        result += "Hello \(friend) "
    }
    result += "I'm " + me + "!"
    return result
}
print(sayHelloToFriend(me: "junlight", friends: "john", "jay", "harry"))

//MARK: - 반환 값이 없는 함수
func Hello () {
    print("hello")
}
Hello()

//MARK: - 함수 타입의 사용
typealias CalculateTwoInts = (Int, Int) -> Int

func addTwoInts(_ a: Int, _ b: Int) -> Int{
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int{
    return a * b
}
func no(_ a: String, _ b: Int) -> Int{
    return b
}

var mathFunction: CalculateTwoInts = addTwoInts
print(mathFunction(2,5))

mathFunction = multiplyTwoInts
print(mathFunction(2,5))

// 매개변수 타입과 개수 반환값이 일치해야지 사용 가능
// mathFunction = no

//MARK: - 중첩 함수
typealias MoveFunc = (Int) -> Int


func functionForMove(_ shouldGoLeft: Bool) -> MoveFunc{
    func goRight(_ crt: Int) -> Int{
        print("right!")
        return crt + 1
    }
    
    func goLeft(_ crt: Int) -> Int{
        print("left!")
        return crt - 1
    }
    
    return shouldGoLeft ? goLeft: goRight
}

var position: Int = -5
//현 위치가 0보다 작으므로 전달되는 인자 값은 false가 됩니다.
//그러므로 goRight 함수가 할당될 것 입니다.

let moveToZero: MoveFunc = functionForMove(position > 0)
print("원점으로")

// 원점에 도착하면 while문이 종료
while position != 0 {
    position = moveToZero(position)
    print("\(position)")
}

//MARK: - 반환 값을 무시할 수 있는 함수
/*
 가끔 함수의 반환 값이 꼭 필요하지 않은 경우도 있습니다.
 프로그래머가 의도적으로 함수의 반환 값을 사용하지 않을 경우
 컴파일러가 함수의 결과 값을 사용하지 않았다는 경고를 보낼 때도 있습니다.
 이런 경우 함수의 반환 값을 무시해도 된다는 @discardableResult 선언 속성을 사용하면 됩니다.
 */

func say(_ something: String) -> String{
    print(something)
    return something
}
@discardableResult func discardableResultSay(_ something: String) -> String {
    print(something)
    return something
}
//반환 값을 사용하지 않았으므로 컴파일러가 경고를 표시할 수 있습니다.
say("hello")

//반환 값을 사용하지 않을 수 있다고 미리 알렸기 때문에
//반환 값을 사용하지 않아도 컴파일러가 경고하지 않습니다.
discardableResultSay("hello")

//MARK: - 종료되지 않는 함수
/*
 종료되지 않는 함수는 비반환 함수, 비반환 메서드라고 합니다.
 이는 정상적으로 끝날 수 없는 함수입니다.
 이 함수를 실행하면 프로세스 동작은 끝났다고 볼 수 있습니다.
 비반환 함수는 반환 타입을 Never라고 명시해주시면 됩니다.
 */

func crashAndBurn() -> Never {
    fatalError("Something very, very bad happened")
}
// 프로세스 종료 후 오류 보고
crashAndBurn()

func someFunction(isAllIsWell: Bool){
    guard isAllIsWell else{
        print("마을에 도둑이 들었습니다!")
        crashAndBurn()
    }
    print("All is well")
}

someFunction(isAllIsWell: true)
someFunction(isAllIsWell: false)

