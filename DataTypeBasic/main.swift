//
//  main.swift
//  DataTypeBasic
//
//  Created by 이준영 on 2022/05/03.
//

import Foundation

//MARK: - Int, UInt
// Int, UInt
// Int는 +,- 부호를 포함한 정수
// UInt는 -을 포함하지 않는 0을 포함한 양의 정수 입니다.
print("========== (Int, UInt) ==========")
var integer: Int = -100
var unsignedInteger: UInt = 100

print("\(type(of: integer)) : \(integer), \(type(of: unsignedInteger)) : \(unsignedInteger)")

//MARK: - Bool
// 불리언 타입은 참(true) 또는 거짓(false) 만 값으로 가집니다.
print("========== (Bool) ==========")
var boolean: Bool = true
print("Bool : ", boolean)

boolean.toggle() // true, false 반전
print("Bool.toggle() : ", boolean)

//MARK: - Float, Double
// Double은 최소 15자리의 신진수를 표현할 수 있는 반면 Float는 6자리의 숫자까지만 표현이 가능합니다.
// 필요에 따라 둘 중 하나를 선택하여 사용할 텐데 무엇을 사용해야 할지 잘 모르는 상황이라면 Double을 사용하길 권장합니다.
print("========== (Float, Double) ==========")

// Float가 수용할 수 있는 범위를 넘어서서 감당할 수 있는 만큼만 남기므로 정확도가 떨어집니다.
var floatValue: Float = 1234567890.1

// Double은 충분히 수용 가능합니다.
var doubleValue: Double = 1234567890.1

print("Float : \(floatValue), Double: \(doubleValue)")

//MARK: - Character
// Character은 말 그대로 문자를 의미합니다.
print("========== (Charactor) ==========")

let alphabetA: Character = "A"
print(alphabetA)
let commandCharacter = "😀"
print(commandCharacter)
let 한글변수이름: Character = "ㄱ"
print(한글변수이름)

//MARK: - String
// String은 문자의 나열 즉 문자열입니다.
print("========== (String) ==========")

// 이니셜라이저를 사용하여 빈 문자열을 생성할 수 있습니다.
var introduce: String = String()

// append를 사용하여 문자열을 이어붙일 수 있습니다.
introduce.append("my name is ")
print(introduce)

// + 연산자를 사용해서 이어붙일 수 있습니다.
introduce = introduce + "junlight" + "입니다."
print(introduce)

// 문자열의 개수를 셀 수 있습니다.
print("글자수 \(introduce.count)")

// 빈값인지 확인 할 수 있습니다.
print("비어 있는지 확인 : ", introduce.isEmpty)

//메서드를 통한 접두어, 접미어 확인
print("전체 문자열 : \(introduce)")
print("my로 시작합니까? : ", introduce.hasPrefix("my"))
print("name로 시작합니까? : ", introduce.hasPrefix("name"))
print("뒤에 입니다로 끝납니까? : ", introduce.hasSuffix("입니다."))

// 원하는 문자가 포함이 되어있는지 확인
// contains("문자, 문자열 둘다 가능")
print("j가 있습니까? : \(introduce.contains("j"))")
print("jun이 있습니까? : \(introduce.contains("jun"))")

//MARK: 인덱스 구하기
// 문자열을 자르거나, 원하는부분의 문자열의 찾을때 자주 사용합니다.
// startIndex : 문자열의 시작 요소 인덱스를 가리킨다.
// endIndex: 문자열의 마지막 요소 인덱스 다음을 가리킨다.
// index(before: String.Index): 인자로 들어온 인덱스 1칸 앞을 가리킨다.
// index(after: String.Index): 인자로 들어온 인덱스 1칸 뒤를 가리킨다.
// index(String.Index, offsetBy: String.IndexDistance): 인자로 들어온 인덱스와 offsetBy 차이만큼 떨어진 곳을 가리킨다.
// firstIndex(of: Character), latIndex(of: Character): 인자로 들어온 문자가 몇번째 인덱스에 있는지

let str = "abcdef"
print("전체 문자 : ", str)
print("startIndex :: ",str[str.startIndex])
print("맨 앞에서 한칸 뒤 :: ",str[str.index(after: str.startIndex)])
print("맨 뒤에서 한칸 앞 :: ",str[str.index(before: str.endIndex)])
print("첫번째에서 2만큼 뒤 :: ",str[str.index(str.startIndex, offsetBy: 2)])
print("마지막에서 2만큼 앞 :: ",str[str.index(str.endIndex, offsetBy: -2)])

