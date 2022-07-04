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


//MARK: - 후행 클로저

// 후행 클로저의 사용
let reverse: [String] = names.sorted() { (first: String, second: String) -> Bool in
    return first > second
}

// sorted(by:) 메서드의 소괄호까지 생략 가능합니다.
let reverse2: [String] = names.sorted {(first: String, second: String) -> Bool in
    return first > second
}

func doSomething(do: (String) -> Void,
                 onSuccess: (Any) -> Void,
                 onFailure: (Error) -> Void){
    
}

// 다중 후행 클로저의 사용
doSomething { someString in
    // do closure
} onSuccess: { result in
    // success closure
} onFailure: { error in
    // failure closure
}

//MARK: 클로저 표현 간소화

// 문맥을 이용한 타입 유추
/*
 메서드의 전달인자로 전달하는 클로저는 메서드에서 요구하는 형태로 전달해야 합니다. 즉, 매개변수의 타입이나 개수, 반환 타입 등이 같아야 전달인자로서 전달할 수 있습니다.
 이를 다르게 말하면, 전달인자로 전달할 클로저는 이미 적합한 타입을 준수하고 있다고 유추할 수 있습니다. 문맥에 따라 적절히 타입을 유추할 수 있습니다.
 그래서 전달인자로 전달하는 클로저를 구현할 때는 매개변수의 타입이나 반환 값의 타입을 굳이 표현해주지않고 생략하더라도 문제가 없습니다.
 */
let munReversed: [String] = names.sorted { (first, second) in
    return first > second
}

//MARK: 단축 인자 이름
/*
 sorted(by:) 메서드로 전달하는 클로저를 살펴보면 또 하나 마음에 들지 않는 점이 있습니다.
 바로 의미없어 보이는 두 매개변수 이름입니다. first, second 정말 아무 의미가 없습니다. 그래서 스위프트에서 단축 인자 이름을 제공합니다.
 단축 인자 이름은 첫 번째 전달인자부터 $0, $1, $2, $3, ... 순서로 $와 숫자의 조합으로 표현합니다.
 단축 인자 표현을 사용하게 되면 매개변수 및 반환 타입과 실행 코드를 구분하기 위해 사용했던 키워드 in을 사용할 필요도 없어집니다.
 */

let danReversed: [String] = names.sorted {
    return $0 > $1
}

//MARK: 암시적 반환 표현
/*
 점점 더 간결해지고 있는 클로저 표현을 보고 있습니다. 클로저에서는 return 키워드도 생략할 수 있습니다.
 만약 클로저가 반환 값을 갖는 클로저이고 클로저 내부의 실행문이 단 한 줄이라면, 암시적으로 실행문을 반환 값으로 사용할 수 있습니다.
 */
let amReversed: [String] = names.sorted {$0 > $1}

//MARK: 연산자 함수
/*
 비교 연산자는 두 개의 피연산자를 통해 Bool 타입의 반환을 줍니다. 우리가 sorted(by:) 메서드에 전달한 클로저와 동일한 조건입니다.
 클로저는 매개변수의 타입과 반환 타입이 연산자를 구현한 함수의 모양과 동일하다면 연산자만 표기하더라도 알아서 연산하고 반환합니다.
 
 public func ><T : Comparable>(lhs: T, rhs: T) -> Bool
 
 여기서 > 자체가 함수의 이름입니다. 더군다나 이 함수는 우리가 전달인자로 보내기에 충분한 조건을 갖고 있습니다.
 아직 제네릭과 프로토콜을 배우지 않아 다 이해할 순 없지만 T를 String으로만 바꿔서 생각하면 됩니다.
 */

//MARK: 값 획득
/*
 클로저는 자신이 정의된 위치의 주변 문맥을 통해 상수나 변수를 획득할 수 있습니다.
 클로저는 비동기 작업에 많이 사용됩니다. 클로저를 통해 비동기 콜백을 작성하는 경우,
 현재 상태를 미리 획득해두지 않으면, 실제로 클로저의 기능을 실행하는 순간에는 주변의 상수나 변수가 이미 메모리에 존재하지 않는 경우가 발생합니다.
 incrementer라는 함수를 중첩 함수로 포함하는 makeIncrementer 함수를 살펴보겠습니다.
 중첩함수인 incrementer()함수는 자신 주변에 있는 runningTotal과 amount라는 두 값을 획득합니다.
 두값을 획득한 후에 incrementer는 클로저로서 makeIncrementer 함수에 의해 반환됩니다.
 */
func makeIncrementer(forIncrement amount: Int) -> (() -> Int) {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

//MARK: 클로저는 참조 타입
/*
 함수나 클로저를 상수나 변수에 할당할 때마다 사실은 상수나 변수에 함수나 클로저의 참조를 설정하는 것입니다.
 클로저의 참조를 다른 상수에 할당해준다면 이는 두 상수가 모두 같은 클로저를 가리킨다는 뜻 입니다.
 */

let incrementByTwo:(() -> Int) = makeIncrementer(forIncrement: 2)
let sameWithIncrementByTwo: (() -> Int) = incrementByTwo

let first: Int = incrementByTwo()           // 2
let second: Int = sameWithIncrementByTwo()  // 4


//MARK: 탈출 클로저
/*
 함수의 전달인자로 전달한 클로저가 함수 종료 후에 호출될 때 클로저가 함수를 탈출한다고 표현합니다.
 클로저를 매개변수로 갖는 함수를 선언할 때 매개변수 이름의 콜론 뒤에 @escaping 키워드를 사용하여
 클로저가 탈출하는 것을 허용한다고 명시해줄 수 있습니다.
 */


typealias VoidVoidClosure = () -> Void
let firstClosure: VoidVoidClosure = {
    print("Closure A")
}
let secondClosure: VoidVoidClosure = {
    print("Closure B")
}

// first와 second 매개변수 클로저는 함수의 반환 값으로 사용될 수 있으므로 탈출 클로저입니다.
func returnOneClosure(first: @escaping VoidVoidClosure, second: @escaping VoidVoidClosure, shouldReturnFirstClosure: Bool) -> VoidVoidClosure{
    // 전달인자로 전달받은 클로저를 함수 외부로 다시 반환하기 때문에 함수를 탈출하는 클로저입니다.
    return shouldReturnFirstClosure ? first : second
}

// 함수에서 반환한 클로저가 함수 외부의 상수에 저장되었습니다.
let returnedClosure: VoidVoidClosure = returnOneClosure(first: firstClosure, second: secondClosure, shouldReturnFirstClosure: true)

returnedClosure() // Closure A

var closures: [VoidVoidClosure] = []

// closure 매개변수 클로저는 함수 외부의 변수에 저장될 수 있으므로 탈출 클로저입니다.
func appendClosure(closure:@escaping VoidVoidClosure) {
    // 전달인자로 전달받은 클로저가 함수 외부의 변수 내부에 저장되므로 함수를 탈출합니다.
    closures.append(closure)
}

// 클래스 인스턴스 메서드에 사용되는 탈출, 비탈출 클로저
typealias VoidClosure = () -> Void

func functionWithNoescapeClosure(closure: VoidClosure){
    closure()
}

func functionWithEscapingClosure(completionHandler: @escaping VoidClosure) -> VoidClosure {
    return completionHandler
}

class SomeClass {
    var x = 10
    
    func runNoescapeClosure() {
        // 비탈출 클로저에서 self 키워드 사용은 선택 사항입니다.
        functionWithNoescapeClosure { x = 200 }
    }
    
    func runEscapeClosure() -> VoidClosure {
        // 탈출 클로저에서는 명시적으로 self를 사용해야 합니다.
        functionWithEscapingClosure { self.x = 100 }
    }
}

let instance: SomeClass = SomeClass()
instance.runNoescapeClosure()
print(instance.x)

let returnedClosure2: VoidClosure = instance.runEscapeClosure()
returnedClosure2()
print(instance.x)

//MARK: withoutActuallyEscaping
/*
 비탈출 클로저로 전달한 클로저가 탈출 클로저인 척 해야 하는 경우.
 실제로 탈출하지 않는데 다른 함수에서 탈출 클로저를 요구하는 상황인 경우
 */
 
let numbers:[Int] = [2, 4, 6, 8]

let evenNumberPredicate = { (number: Int) -> Bool in
    return number % 2 == 0
}

let oddNumberPredicate = { (number: Int) -> Bool in
    return number % 2 == 1
}

func hasElements(in array: [Int], match predicate: (Int) -> Bool) -> Bool {
    return withoutActuallyEscaping(predicate, do: { escapablePredicate in
        return (array.lazy.filter { escapablePredicate($0) }.isEmpty == false)
    })
}

let hasEvenNumber = hasElements(in: numbers, match: evenNumberPredicate)
let hasOddNumber = hasElements(in: numbers, match: oddNumberPredicate)

print(hasEvenNumber) // true
print(hasOddNumber)  // false

//MARK: 자동 클로저
/*
 함수의 전달인자로 전달하는 표현을 자동으로 변환해주는 클로저를 자동 클로저라고 합니다.
 자동 클로저는 전달인자를 갖지 않습니다. 호출되었을 때 자신이 감싸고 있는 코드의 결괏값을 반환합니다.
 */

// 클로저를 이용한 연산 지연
// 대기 중인 손님들입니다.
var customersInLine: [String] = ["동훈", "용덕", "선우", "사랑"]
print(customersInLine.count) // 4

// 클로저를 만들어두면 클로저 내부의 코드를 미리 실행하지 않고 가지고만 있습니다.
let customerProvider: () -> String = {
    return customersInLine.removeFirst()
}
print(customersInLine.count) // 4

// 실제로 실행합니다.
print("\(customerProvider())님 입장하시면 됩니다.")
print(customersInLine.count) // 3

// 함수의 전달인자로 전달하는 클로저
func serveCustomer(_ customerProvider: () -> String) {
    print("\(customerProvider())님 입장하시면 됩니다.")
}
serveCustomer({ customersInLine.removeFirst() })


// 자동 클로저의 사용
func serveAuto(_ customerProvider: @autoclosure() -> String) {
    print("\(customerProvider())님 입장하시면 됩니다.")
}
serveAuto(customersInLine.removeFirst())

// 자동 클로저의 탈출
func returnProvider(_ customerProvider: @autoclosure @escaping() -> String) ->(() -> String) {
    return customerProvider
}
let customerAuto: () -> String = returnProvider(customersInLine.removeFirst())
print("\(customerAuto())님 입장하시면 됩니다.")
