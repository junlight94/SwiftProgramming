//
//  main.swift
//  FlowControl
//
//  Created by 이준영 on 2022/05/10.
//

import Foundation

//MARK: - if 문
/*
 if 구문은 대표적인 조건문으로 if, else 등의 키워드를 사용해서 구현할 수 있습니다.
 스위프트의 if 구문은 조건의 값이 꼭 Bool 타입이어야 합니다.
 */
print("========== (if) ==========")

// if 구문
let first: Int = 5
let second: Int = 7

if first > second {
    print("first > second")
} else if first < second {
    print("first < second")
} else {
    print("first == second")
}

//MARK: - switch 구문
/*
 스위프트에서 switch 구문의 case를 연속 실행하려면 fallthrough 키워드를 사용합니다.
 case에 들어갈 비교 값은 입력 값과 데이터 타입이 같아야하고
 비교될 값이 명확히 한정적인 값이 아닐 때는 defualt를 꼭 작성해줘야 합니다.
 */

print("========== (switch) ==========")
// switch 기본 구현
let integerValue: Int = 5

switch integerValue {
case 0:
    print("Value == zero")
case 0...10:
    print("Value == 1~10")
    fallthrough
case Int.min..<0, 101..<Int.max:
    print("Value < 0 or Value <= 100")
    break
default:
    print("10 < Value <= 100")
}

// where를 사용하여 switch case 확장
let 직급: String = "사원"
let 연차: Int = 1
let 인턴인가: Bool = false

switch 직급 {
case "사원" where 인턴인가 == true:
    print("인턴입니다.")
case "사원" where 연차 < 2 && 인턴인가 == false:
    print("신입사원입니다.")
case "사원" where 연차 > 5:
    print("연식 좀 된 사원입니다.")
case "사원":
    print("사원입니다.")
case "대리":
    print("대리입니다.")
default:
    print("사장입니까?")
}


// 열거형 switch
// 열거형에 case를 처리해주지 않은게 있다면 경고를 내어줄 unknown 속성
enum Menu {
    case chiken, pizza, hamburger
}
let lunchMenu: Menu = .chiken

switch lunchMenu {
case .chiken:
    print("치킨")
case .pizza:
    print("피자")
@unknown case _:
   print("오늘 메뉴가 머죵?")
}

//MARK: - 반복문
/*
 스위프트에서는 전통적인 C 스타일의 for 구문이 사라졌습니다.
 do-while 구문은 repeat-while 구문으로 구현되어 있습니다.
 */

//MARK: for-in 구문
print("========== (for-in) ==========")
/*
 for 임시 상수 in 시퀀스 아이템 {
    실행코드
 }
 */

//기본 for-in 구문 사용
for i in 0...2 {
    print(i)
}

for i in 0...5 {
    if i.isMultiple(of: 2){
        print(i)
        continue //continue 키워드를 사용하면 바로 다음 시퀀스로 건너뜁니다.
    }
    print("\(i) == 홀수")
}

let helloSwift: String = "Hello Swift!"
for char in helloSwift {
    print(char)
}


//MARK: while 구문
print("========== (while) ==========")

var names = ["Joker", "Jenny", "Nova", "junlight"]

while names.isEmpty == false {
    print("Goodbye \(names.removeFirst())");
}

//MARK: repeat-while 구문
print("========== (repeat-while) ==========")
names = ["Joker", "Jenny", "Nova", "junlight"]
repeat {
    print("Goodbye \(names.removeFirst())");
} while names.isEmpty == false
