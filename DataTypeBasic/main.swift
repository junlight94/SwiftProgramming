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


