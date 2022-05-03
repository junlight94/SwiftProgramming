//
//  main.swift
//  varlet
//
//  Created by 이준영 on 2022/05/03.
//

import Foundation

// 변수는 생성 후 데이턱밧을 변경할 수 있지만,
// 상수는 한번 값을 설정하면 다음에 변경할 수 없습니다.

var name: String = "junlight"
var age: Int = 100

print("====== 변수 ======")
// 타입추론 사용 (변수 옆에 굳이 형을 선언하지 않아도 알아서 지정한다)
var job = "iOS Programmer"
var height = 183.5
print("타입추론 사용, 키의 타입은 : \(type(of: height))")

// 변수는 값을 변경 할 수 있습니다.
// 값을 변경할 때는 기존과 같은 타입의 값을 할당해주어야 합니다.
age = 99
job = "Devoloper"

print("나이 : \(age), 직업 : \(job)")

print("====== 상수 ======")

let letName: String = "junlight"
let letAge: Int = 100

// 상수를 변경하게되면 오류가 발생합니다.
//letName = "hi"
