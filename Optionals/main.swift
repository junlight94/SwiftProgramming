//
//  main.swift
//  Optionals
//
//  Created by Junyoung Lee on 2022/05/11.
//

import Foundation

//MARK: - 옵셔널
/*
 옵셔널은 단어 뜻 그대로 '선택적인' 값이 있을 수도, 없을 수도 있음을 나타내는 표현 입니다.
 이는 변수나 상수 등에 꼭 값이 있다는 것을 보장할 수 없다. 즉, 변수 또는 상수의 값이 nil일 수도 있다는 것을 의미합니다.
 그래서 이 옵셔널 값을 안전하게 사용하기 위해서는 '옵셔널 바인딩'이라는 것을 해줘야 합니다.
 */

//MARK: 옵셔널 값의 강제 추츨
// 강제 옵셔널 추출은 뒤에 !를 붙이면 됩니다.
// 하지만 이 방법은 만약 값이 없을 경우 런타임 오류가 발생하기 때문에 거의 사용하지 않습니다.

// 변수 안에 값이 있을 경우는 강제 추출을 해도 오류가 발생하지 않습니다.
var myName: String? = "junlight"
print(myName!)

// 하지만 만약 값이 nil이면 런타임 오류를 발생 시킵니다.
myName = nil
//print(myName!)

//MARK: - 옵셔널 바인딩을 사용한 값의 추출
// 옵셔널 바인딩에는 if let과 guard let이 있습니다.
// if let 같은 경우 블록 내부에서만 임시 상수를 사용할 수 있습니다.
// 아래와 같이 me라는 임시 상수는 if let 안에서만 사용이 가능하고 밖에서는 사용이 불가능하다
// 만약 밖에서 사용하고 싶은 경우가 생긴다면 이 때 guard let을 사용하도록 하자

//MARK: if let
//var junlight: String? = "junlight"
var junlight: String? = nil
if let me = junlight {
    //만약 값이 있다면 name이라는 임시 상수를 사용할 수 있다.
    print(me)
} else {
    //값이 없다면 else에서 처리할 수 있다.
    print("nil")
}

// MARK: guard let
// guard let은 if let과 반대로 nil일 경우 블록 안에서 return 해주고
// 밖에서 me라는 값을 사용할 수 있다.
//var hi: String? = "hi"
var hi: String? = nil

binding()

func binding(){
    guard let me = hi else {return print("nil")}
    print(me)
}

// MARK: 옵셔널 바인딩을 사용한 여러개의 값 추출
var one: String? = "1"
var two: String? = "2"

if let first = one, let second = two {
    print(first, second)
}
