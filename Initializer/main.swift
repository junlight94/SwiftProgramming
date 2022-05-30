//MARK: 인스턴스 생성과 소멸
import Foundation

//MARK: 인스턴스 생성
/*
 초기화 과정은 새로운 인스턴스를 사용할 준비를 하기 위하여 저장 프로퍼티의 초깃값을 설정 하는 등의 일을 합니다.
 - 이니셜라이저를 정의하면 초기화 과정을 직접 구현할 수 있습니다.
 - 스위프트의 이니셜라이저는 반환 값이 없습니다.
 
 이니셜라이저는 해당 타입의 새로운 인스턴스를 생성하기 위해 호출합니다.
 init 메서드는 클래스, 구조체, 열거형 등의 구현부 또는 해당 타입의 익스텐션 구현부에 위치합니다.
 다만 클래스의 지정 이니셜라이저는 익스텐션에서 구현해줄 수 없습니다.
 */

class SomeClass {
    init() {
        // 초기화할 때 필요한 코드
    }
}
struct SomeStruct {
    init() {
        // 초기화할 때 필요한 코드
    }
}

enum SomeEnum {
    case someCase
    
    init() {
        // 열거형은 초기화할 때 반드시 case중 하나가 되어야 합니다.
        self = .someCase
        // 초기화할 때 필요한 코드
    }
}


//MARK: 프로퍼티 기본값
/*
 구조체와 클래스의 인스턴스는 처음 생성할 때 옵셔널 저장 프로퍼티를 제외한 모든 저장 프로퍼티에 적절한 초깃값을 할당해야 합니다.
 이니셜라이저가 실행될 때 저장 프로퍼티에 적절한 초깃값을 할당할 수 있습니다.
 프로퍼티를 정의할 때 프로퍼티 기본값을 할당하면 이니셜라이저에서 따로 초깃값을 할다하지 않더라도 프롵퍼티 기본값으로 저장 프로퍼티의 값이 초기화됩니다.
 */

struct DefaultStruct {
    var squareMeter: Double
    
    init() {
        squareMeter = 0.0 // squareMeter의 초깃값 할당
    }
}
let room: DefaultStruct = DefaultStruct()
print(room.squareMeter) // 0.0

/*
 이니셜 라이저로 저장 프로퍼티에 초깃값을 설정하는 방식도 있지만, 프로퍼티를 정의할 때
 프로퍼티에 기본값을 할당하는 방식을 사용할 수도 있습니다.
 */
struct DefaultStructTwo {
    var squareMeter: Double = 0.0
}
let roomTwo: DefaultStructTwo = DefaultStructTwo()
print(roomTwo.squareMeter)

//MARK: 이니셜라이저 매개변수
/*
 함수나 메서드를 정의할 때와 마찬가지로 이니셜라이저도 매개변수를 가질 수 있습니다.
 인스턴스를 초기화하는 과정에 필요한 값을 전달받을 수 있습니다.
 */
struct InitParam {
    var squareMeter: Double
    
    init(fromPy py: Double){
        squareMeter = py * 3.3058
    }
    
    init(fromSquareMeter squareMeter: Double) {
        self.squareMeter = squareMeter
    }
    
    init(value: Double) {
        squareMeter = value
    }
    
    init(_ value: Double) {
        squareMeter = value
    }
}
let room1: InitParam = InitParam(fromPy: 15.0)
print(room1.squareMeter) // 49.587
let room2: InitParam = InitParam(fromSquareMeter: 33.06)
print(room2.squareMeter) // 33.06
let room3: InitParam = InitParam(value: 30.0)
let room4: InitParam = InitParam(55.0)

//MARK: 옵셔널 프로퍼티 타입
/*
 초기화 과정에서 값을 초기화하지 않아도 되는, 즉 인스턴스가 사용되는 동안에 값을 꼭 갖지 않아도 되는 저장프로퍼티가 있다면
 해당 프로퍼티를 옵셔널로 선언할 수 있습니다. 또는 초기화 과정에서 값을 지정해주기 어려운 경우
 저장 프로퍼티를 옵셔널로 선언할 수도 있습니다. 옵셔널로 선언한 저장프로퍼티는 초기화 과정에서 값을 할당해주지 않는다면
 자동으로 nil이 할당됩니다.
 */
class OptionalPerson {
    var name: String
    var age: Int?
    
    init (name: String) {
        self.name = name
    }
}
let junlight: OptionalPerson = OptionalPerson(name: "junlight")
print(junlight.name) // junlight
print(junlight.age) // nil

junlight.age = 29
print(junlight.age) // 29

junlight.name = "Eric"
print(junlight.name) // Eric

//MARK: 상수 프로퍼티
/*
 프로퍼티를 상수가 아닌 변수로 선언 해준다면, 값을 할당하고 난 후에 전혀 다른 값으로 변할 수 있습니다.
 이런 상황을 방지하려면 name프로퍼티를 상수로 선언해야 합니다.
 이때 고려해야 할 점이 있습니다. 상수로 선언된 저장 프로퍼티는 인스턴스를 초기화하는 과정에서만 값을 할당할 수 있으며,
 처음 할당된 이후로는 값을 변경할 수 없습니다. 이 점을 꼭 기억해두어야 합니다.
 */
class LetPerson {
    let name: String
    var age: Int?
    
    init(name: String){
        self.name = name
    }
}

let letName: LetPerson = LetPerson(name: "junlight")
//letName.name = "Eric" //오류 발생

//MARK: 기본 이니셜라이저와 멤버와이즈 이니셜라이저
/*
 사용자 정의 이니셜라이저를 정의해주지 않으면 클래스나 구조체는 모든 프로퍼티에 기본값이 지정되어 있다는 전제하에 기본 이니셜라이저를 사용합니다.
 기본이니셜라이저는 프로퍼티 기본값으로 프로퍼티를 초기화해서 인스턴스를 생성합니다.
 기본 이니셜라이저는 저장 프로퍼티의 기본값이 모두 지정되어 있고, 동시에 사용자 정의 이니셜라이저가 정의되어 있지 않은 상태에서 제공 됩니다.
 구조체는 사용자 정의 이니셜랑지ㅓ를 구현하지 ㅇ낳으면 프로퍼티의 이름으로 매개변수를 갖는 이니셜라이저인 멤버와이즈 이니셜라이저를 기본으로 제공합니다.
 하지만 플래스는 멤버와이즈 이니셜라이저를 지우너하지 않습니다.
 */
struct Point {
    var x: Double = 0.0
    var y: Double = 0.0
}

struct Size {
    var width: Double = 0.0
    var height: Double = 0.0
}

let point: Point = Point(x: 0, y: 0)
let size: Size = Size(width: 50.0, height: 50.0)

// 구조체의 저장 프로퍼티에 기본값이 있는 경우
// 필요한 매개변수만 사용하여 초기화할 수도 있습니다.
let somePoint: Point = Point()
let someSize: Size = Size(width: 50)
let anotherPoint: Point = Point(y: 100)

//MARK: 초기화 위임
/*
 값 타입에서 이니셜라이저가 다른 이니셜라이저를 호출하려면 self.init을 사용합니다.
 당연히 self.init은 이니셜라이저 안에서만 사용할 수 있는데
 self.init을 사용한다는 것 자체가 사용자 정의 이니셜라이저를 정의하고 있다는 뜻입니다.
 그런데 사용자 정의 이니셜라이저를 정의하면 기본 이니셜라이저와 멤버와이즈 이니셜라이저를 사용할 수 없다고 했습니다.
 따라서 초기화 위임을 하려면 최소 두 개 이상의 사용자 정의 이니셜라이저를 정의해야 합니다.
 */
enum Student {
    case elementary, middle, high
    case none
    
    // 사용자 정의 이니셜라이저가 있는 경우, init() 메서드를 구현해주어야 기본 이니셜라이저를 사용할 수 있습니다.
    init() {
        self = .none
    }
    
    init(koreanAge: Int) {
        switch koreanAge {
        case 8...13:
            self = .elementary
        case 14...16:
            self = .middle
        case 17...19:
            self = .high
        default:
            self = .none
        }
    }
    
    init(bornAt: Int, currentYear: Int) {
        self.init(koreanAge: currentYear - bornAt + 1)
    }
}

var younger: Student = Student(koreanAge: 16)
print(younger) // middle
younger = Student(bornAt: 1998, currentYear: 2016)
print(younger) // high
