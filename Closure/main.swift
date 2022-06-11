//MARK: 클로저(Closure)
import Foundation

/*
 스위프트의 클로저는 다른 언어의 람다(Lambda)와 유사합니다. 클로저는 일정 기능을 하는 코드를 하나의 블록으로 모아놓은 것을 말합니다.
 함수는 클로저의 한 형태입니다.
 클로저는 변수나 상수가 선언된 위치에 참조를 획득하고 저장할 수 잇습니다. 이를 변수나 상수의 클로징(잠금)이라고 하며
 클로저는 여기서 착안된 이름입니다. 획득 때문에 메모리에 부담이 가지 않을까 걱정할 수도 있지만, 스위프트는 스스로 메모리를 관리합니다.
 클로저에는 세가지 형태가 있습니다.
 - 이름이 있으면서 어떤 값도 획득하지 않는 전역함수 형태
 - 이름이 있으면서 다른 함수 내부의 값을 획득할 수 있는 중첩된 함수의 형태
 - 이름이 없고 주변 문맥에 따라 값을 획득할 수 있는 축약 문법으로 작성한 형태
 
 * 클로저는 매개변수와 반환 값의 타입을 문맥을 통해 유추할 수 있기 때문에 매개변수와 반환 값의 타입을 생략할 수 있습니다.
 * 클로저에 단 한줄의 표현만 들어있다면 암시적으로 이를 반환 값으로 취급합니다.
 * 축약된 전단인자 이름을 사용할 수 있습니다.
 *후행 클로저 문법을 사용할 수 있습니다.
 */

//MARK: - 기본 클로저
/*
 기본 클로저 내용을 포함하여 앞으로 sorted(by:) 메서드를 이용해 동일한 기능을 하는 코드를 어떻게 간결하게 표현하는지 알아보겠습니다.
 스위프트 표준 라이브러리에는 배열의 값을 정렬하기 위해 구현한 sorted(by:) 메서드가 있습니다.
 이 메서드는 클로저를 통해 어떻게 정렬할 것인가에 대한 정보를 받아 처리하고 결괏값을 배열로 돌려줍니다.
 단순히 정렬만 하기 때문에 입력 받은 배열의 타입과 크기가 동일하빈다. 기존의 배열은 변경하지 않고 정렬된 배열을 새로 생성하여 반환해줍니다.
 */

//MARK: 스위프트 라이브러리의 sorted(by:) 메서드 정의
//public func sorted(by areInIncreasingOrder: (Element, Element) -> Bool) -> [Element]

//MARK: 정렬에 사용될 이름 배열
let names: [String] = ["junlight", "eric", "harry", "son"]

//MARK: 정렬을 위한 함수 전달
func backwards(first: String, second: String) -> Bool {
    print("\(first) \(second) 비교중")
    return first > second
}

let reversed1: [String] = names.sorted(by: backwards)
print(reversed1)

//MARK: 클로저의 통상 표현
/*
 { (매개변수들) -> 반환타입 in
     실행코드
 }
 */

//MARK: backwards(first: <#T##String#>, second: <#T##String#>) 함수를 클로저 표현으로 대체해보겠습니다.
// backwards(first: <#T##String#>, second: <#T##String#>) 함수 대신에 sorted(by:) 메서드의 전달인자로 클로저를 직접 전달합니다.
let reversed2: [String] = names.sorted(by: {(first: String, second: String) -> Bool in
    return first > second
})
print(reversed2)
