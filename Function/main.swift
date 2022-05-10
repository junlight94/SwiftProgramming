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

// 기본 형태의 함수 정의와 사용
func hello(name: String) -> String {
    return "Hello \(name)"
}
print(hello(name: "junlight"));

//MARK: 매개 변수가 없는 함수
func helloWorld() -> String {
    return "Hello, world"
}
print(helloWorld())

//MARK: 매개 변수가 여러 개인 함수
func sayHello(myName: String, yourName: String) -> String {
    return "Hello \(yourName)! I'm \(myName)"
}
print(sayHello(myName: "junlight", yourName: "chulsoo"))

//MARK: 전달인자 레이블을 가지는 함수
func sayHello(from myName: String, to yourName: String) -> String{
    return "Hello \(yourName)! I'm \(myName)"
}
print(sayHello(from: "junlight", to: "jenny"))

//MARK: 와일드카드 사용 전달인자 레이블이 없는 함수
func sayHello (_ name: String, _ times: Int) -> String{
    var result = ""
    
    for _ in 0..<times {
        result += "Hello \(name)" + " "
    }
    
    return result
}
print(sayHello("junlight", 5))
