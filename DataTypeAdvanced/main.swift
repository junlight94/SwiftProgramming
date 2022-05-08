//
//  main.swift
//  DataTypeAdvanced
//
//  Created by Junyoung Lee on 2022/05/08.
//
import Foundation

//MARK: - 튜플
// 튜플은 프로그래머 마음대로 만드는 지정된 데이터의 묶음 입니다.
// 튜플은 타입 이름이 따로 없습니다.
print("========== (Tuple) ==========")
var person: (String, Int, Double) = ("junlight", 29, 183.5)
print("데이터 바뀌기 전")
print("이름: \(person.0), 나이: \(person.1), 신장: \(person.2)")

// 인덱스를 통해 값을 할당할 수 있습니다.
person.0 = "jun"
person.1 = 30
person.2 = 168.3

print("데이터 바뀐 후")
print("이름: \(person.0), 나이: \(person.1), 신장: \(person.2)")

//MARK: - 컬렉션형
// 컬렉션 타입에는 배열(Array), 딕셔너리(Dictionary), 세트(Set) 등이 있습니다.

//MARK: - 배열(Array)
// 배열은 같은 타입의 데이터를 일렬로 나열한 후 순서대로 저장하는 형태의 컬렉션 타입입니다.
print("========== (Array) ==========")

var names: Array<String> = ["junlight", "chulsoo", "younghee", "jun"]
// 위와 정확히 동일한 표현입니다.
var renames: [String] = ["junlight", "chulsoo", "younghee", "jun"]

// Any 데이터를 요소로 갖는 빈 배열을 생성합니다.
var emptyArray: [Any] = [Any]()

// 빈 값 확인
print("emptuArray 빈 값 확인 : \(emptyArray.isEmpty)")

// 배열의 개수 확인
print("names 개수 확인 : \(names.count)")

// 배열 접근
print("names 배열 : \(names)")
print("names의 2번째 요소 출력 : \(names[2])")
names[2] = "jenny" // 2번째 요소에 jenny 삽입 chulsoo는 없어짐
print("names의 2번째 요소 출력 : \(names[2])")

print("names 배열 : \(names)")
print("배열의 첫번째 요소 : \(names.first)")
print("배열의 마지막 요소 : \(names.last)")
print("배열의 요소 찾기 : \(names.firstIndex(of: "jenny"))")

// 추가
names.append("john")
print(names)

names.append(contentsOf: ["john", "max"])
print(names)

names.insert("cloud", at: 2)
print(names)

names.insert(contentsOf: ["jinhee", "minsoo"], at: 5)
print(names)

// 삭제
print("names 배열 : \(names)")
names.removeFirst()
print("remove First : \(names)")
names.removeLast()
print("remove Last : \(names)")
names.remove(at: 2)
print("remove(at: 2) : \(names)")
if let idx = names.firstIndex(of: "jun"){
    names.remove(at: idx)
}
print("첫번째로 나오는 jun 찾아서 삭제 : \(names)")

//MARK: - 딕셔너리(Dictionary)
// 키와 값의 쌍으로 구성되는 컬렉션 타입 입니다.
print("========== (Dictionary) ==========")

// 키와 값 타입을 정확히 명시 해줬다면 [:]만으로도 빈 딕셔너리를 생성할 수 있습니다.
var StringInt: [String: Int] = [:]

var numberForName: [String: Int] = ["junlight": 100, "chulsoo": 90, "jenny": 80]

// 딕셔너리의 사용
// 딕셔너리는 각 값에 키로 접근할 수 있습니다.
// 딕셔너리 내부에서 키는 유일해야 하며, 값은 유일하지 않습니다.
print("junlight의 값은 : \(numberForName["junlight"] ?? 0)")

numberForName["junlight"] = 150 // 값을 수정 해 줄 수 있습니다.
print("junlight의 값은 : \(numberForName["junlight"] ?? 0)")

//max라는 키가 없으면 max:999라는 값을 추가 해 줍니다.
numberForName["max"] = 999
print(numberForName)

//삭제
numberForName.removeValue(forKey: "max")
print(numberForName)

//max 키에 해당하는 값이 없으면 기본으로 0이 반환 됩니다.
print(numberForName["max", default: 0])

//MARK: - 세트(Set)
// 세트는 같은 데이터 타입의 데이터를 순서 없이 하나의 묶음으로 저장하는 형태의 컬렉션 타입입니다.
// 세트 내의 값은 모두 유일한 값, 즉 중복된 값이 존재하지 않습니다.
// 세트는 보통 순서가 중요하지 않거나 각 요소가 유일한 값이어야 하는 경우에 사용합니다.
print("========== (Set) ==========")

// 빈값의 세트 생성
var setNumber: Set<Int> = []
var setNumber2: Set<Int>

// 세트의 사용
setNumber = [1, 2, 3, 4, 5, 5] // 중복된 값은 제거 됩니다.
print(setNumber)

setNumber.remove(1)
print("1 제거 : \(setNumber)")

// 안에 요소들을 정렬 해 줄 수 있습니다.
print(setNumber.sorted())

// 세트는 내부의 값들이 모두 유일함을 보장하므로, 집합관계를 표현하고자 할 때 유용하게 쓰일 수 있습니다.
let num1: Set<Int> = [1, 2, 3]
let num2: Set<Int> = [1, 4, 5, 6, 7]

//교집합
print("교집합 : ",num1.intersection(num2))

//여집합
print("여집합 : ",num1.symmetricDifference(num2).sorted())

//합집합
print("합집합 : ",num1.union(num2).sorted())

//차집합
print("차집합 : ",num1.subtracting(num2).sorted())

//MARK: - 열거형(Enum)
// 열거형은 연관된 항목들을 묶어서 표현할 수 있는 타입입니다.
// 프로그래머가 정의해준 항목 값 외에는 추가/수정이 불가합니다.
// 사용하는 경우
// 1. 제한된 선택지를 주고 싶을 때
// 2. 정해진 값 외에는 입력받고 싶지 않을 때
// 3. 예상된 입력 값이 한정되어 있을 때
print("========== (Enum) ==========")
