
//MARK: - 프로퍼티
import Foundation

/*
 프로퍼티는 크게 저장 프로퍼티, 연산 프로퍼티, 타입프로퍼티로 나눌 수 있습니다.
 - 저장 프로퍼티
 인스턴스의 변수 또는 상수를 의미합니다.
 구조체와 클래스에서만 사용할 수 있습니다.
 - 연산 프로퍼티
 특정 연산을 싱행한 결괏값을 의미합니다.
 -타입 프로퍼티
 저장 프로퍼티와 연산 프로퍼티는 특정 타입의 인스턴스에 사용되는 것을 뜻하지만
 특정 타입에 사용되는 프로퍼티가 타입 프로퍼티 입니다.
 정리
 인스턴스 변수는 저장프로퍼티
 클래스 변수는 타입프로퍼티로 구분지을 수 있습니다.
 더불어 프로퍼티의 값이 변하는 것을 감시하는 프로퍼티 감시자도 있습니다.
 프로퍼티 감시자는 프로퍼티의 값이 변할 때 값의 변화에 따른 특정 작업을 실행합니다.
 프로퍼티 감시자는 저장 프로퍼티에 적용할 수 있으며 부모클래스로부터 상속받을 수 있습니다.
 */

//MARK: - 저장 프로퍼티
// 저장 프로퍼티의 선언 및 인스턴스 생성
struct CoordinatePoint {
    var x: Int // 저장 프로퍼티
    var y: Int // 저장 프로퍼티
}

// 구조체에는 기본적으로 저장 프로퍼티를 매개변수로 갖는 이니셜라이저가 있습니다.
let junlightPoint: CoordinatePoint = CoordinatePoint(x: 10, y: 5)

// 사람의 위치 정보
class Position {
    var point: CoordinatePoint
    let name: String //저장 프로퍼티 (상수)
    
    //프로퍼티 기본값을 지정해주지 않는다면 이니셜라이저를 따로 정의해주어야 합니다.
    init(name: String, currentPoint: CoordinatePoint){
        self.name = name
        self.point = currentPoint
    }
}

// 사용자 정의 이니셜라이저를 따로 정의해주어야 합니다.
// 그렇지 않으면 프로퍼티 초깃값을 할당할 수 없기 때문에 인스턴스 생성이 불가능합니다.
let junlightPosition = Position(name: "junlight", currentPoint: junlightPoint)

//MARK: 저장 프로퍼티의 초깃값 지정
struct Person {
    var name: String = "junlight"
    var age: Int = 29
}

// 프로퍼티의 초깃값을 할당했다면 굳이 전달인자로 초깃값을 넘길 필요가 없습니다.
let junlight: Person = Person()

// 물론 기존에 초깃값을 할당할 수 있는 이니셜라이저도 사용 가능합니다.
let friend: Person = Person(name: "sunwoo", age: 26)

print(junlight.name)
print(friend.name)

class Info {
    var jun: Person = Person()
    var height: String = "Unkown"
}

// 초깃값을 지정해줬다면 사용자 정의 이니셜라이저를 사용하지 않아도 됩니다.
let myInfo: Info = Info()

myInfo.jun = junlight
myInfo.height = "183.5"

//MARK: 옵셔널 저장 프로퍼티
struct OptionPoint{
    // 위치는 x, y 값이 모두 있어야 하므로 오셔널이면 안 됩니다.
    var x: Int
    var y: Int
}

// 사람의 위치 정보
class OptionPosition{
    // 현재 사람의 위치를 모를 수도 있습니다. -옵셔널
    var point: OptionPoint?
    
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

// 이름은 필수지만 위치는 모를 수 있습니다.
let optionPostion: OptionPosition = OptionPosition(name: "junlight")

// 위치를 알게되면 그 때 위치 값을 할당해줍니다.
optionPostion.point = OptionPoint(x: 10, y: 10)

//MARK: 지연 저장 프로퍼티
/*
 지연 저장 프로퍼티
 지연 저장 프로퍼티는 호출이 있어야 값을 초기화하며, lazy 키워드를 사용합니다.
 상수는 인스턴스가 완전히 생성되기 전에 초기화해야 하므로 필요할 때 값을 항당하는 지연저장 프로퍼티와는 맞지 않습니다.
 따라서 지연 저장 프로퍼티는 var 키워드를 사용하여 변수로 정의합니다.
 지연 저장 프로퍼티는 주로 복잡한 클래스나 구조체를 구현할 때 많이 사용합니다.
 - 클래스의 저장프로퍼티로 다른 클래스 인스턴스나 구조체 인스턴스를 할당 해야 할 때가 있을 때
 - 굳이 모든 저장 프로퍼티를 사용할 피룡가 없을 때
 */

struct LazyPoint{
    var x: Int = 0
    var y: Int = 0
}

class LazyPosition{
    lazy var point: LazyPoint = LazyPoint()
    let name: String
    
    init(name: String){
        self.name = name
    }
}

let junPosition: LazyPosition = LazyPosition(name: "junlight")

// 이 코드를 통에 프로퍼티로 처음 접근할 때
// point 프로퍼티의 LazyPoint가 생성됩니다.
print(junPosition.point)

//MARK: 연산 프로퍼티
/*
 연산 프로퍼티는 실제 값을 저장하는 프로퍼티가 아니라, 특정 상태에 따른 값을 연산하는 프로퍼티입니다.
 인스턴스 내/외부의 값을 연산하여 적절한 값을 돌려주는 접근자(getter)의 역할이나
 은닉화된 내부의 프로퍼티 값을 간접적으로 설정하는 설정자(setter)의 역할을 할 수도 있습니다.
 클래스, 구조체, 열거형에 연산 프로퍼티를 정의할 수 있습니다.
 */

//MARK: 연산 프로퍼티의 정의와 사용
struct OpPoint {
    var x: Int // 저장 프로퍼티
    var y: Int // 저장 프로퍼티
    
    // 대칭 좌표
    var oppositePoint: OpPoint{ // 연산 프로퍼티
        // 접근자
        get {
            return OpPoint(x: -x, y: -y)
        }
        // 설정자
        set(opposite) {
            x = -opposite.x
            y = -opposite.y
        }
    }
}

var myopPosition: OpPoint = OpPoint(x: 10, y: 20)

// 현재 좌표
print(myopPosition)

// 대칭 좌표
print(myopPosition.oppositePoint)

// 대칭 좌표를 (15, 15)로 설정하면
myopPosition.oppositePoint = OpPoint(x: 15, y: 15)
// -15, -15 가 나옵니다.
print(myopPosition)

//MARK: 읽기전용 연산 프로퍼티
struct ReadPoint{
    var x: Int
    var y: Int
    
    // 대칭 좌표
    var oppositePoint: ReadPoint {
        // 접근자
        return ReadPoint(x: -x, y: -y)
    }
}

var readPostion: ReadPoint = ReadPoint(x: 10, y: 10)

print(readPostion)
print(readPostion.oppositePoint)

//MARK: 프로퍼티 감시자
/*
 프로퍼티 감시자를 사용하면 프로퍼티의 값이 변경됨에 따라 적절한 작업을 취할 수 있습니다.
 프로퍼티 감시자는 프로퍼티의 값이 새로 할당될 때마다 호출합니다. 이때 변경되는 값이 현재 값이랑 같더라도 호출됩니다.
 프로퍼티 감시자에는 프로퍼티의 값이 변경되기 직전에 호출되는 willSet메서드와
 프로퍼티의 값이 변경된 직후에 호출하는 didSet 메서드가 있습니다.
 willSet = 변경될 값
 didSet = 변경 전 값
 매개변수 이름을 따로 지정하지 않으면 willSet에는 newValue, didSet에는 oldValue가 자동 지정됩니다.
 */

class Account {
    var credit: Int = 0{
        willSet(new) {
            print("잔액이\(credit)원에서 \(new)원으로 변경될 예정입니다.")
        }
        didSet(old) {
            print("잔액이\(old)원에서 \(credit)원으로 변경되었습니다..")
        }
    }
}
let myAccount: Account = Account()

myAccount.credit = 1000

// 상속받은 연산 프로퍼티의 프로퍼티 감시자 구현
/*
 연산 프로퍼티인 dollarValue가 포함되어 있는 OverAccount 클래스를 상속받은
 ForeignAccount 클래스에서 기존 dollarValue 프로퍼티를 재정의하여 프로퍼티 감시자를
 구현하는 예제입니다.
 */
print("\n상속받은 연산 프로퍼티의 프로퍼티 감시자 구현")
class OverAccount {
    var credit: Int = 0{
        willSet {
            print("잔액이\(credit)원에서 \(newValue)원으로 변경될 예정입니다.")
        }
        didSet {
            print("잔액이\(oldValue)원에서 \(credit)원으로 변경되었습니다..")
        }
    }
    var dollarValue: Double {
        get{
            return Double(credit) / 1000.0
        }
        set{
            credit = Int(newValue * 1000)
            print("잔액을 \(newValue)달러로 변경 중입니다.")
        }
    }
}

class ForeignAccount: OverAccount {
    override var dollarValue: Double {
        willSet{
            print("잔액이 \(dollarValue)달러에서 \(newValue)달러로 변경될 예정입니다.")
        }
        didSet{
            print("잔액이 \(oldValue)달러에서 \(dollarValue)달러로 변경 되었습니다.")
        }
    }
}

let overAccount: ForeignAccount = ForeignAccount()
overAccount.credit = 1000
overAccount.dollarValue = 2

//MARK: 프로퍼티(전역변수, 지역변수)
/*
 연산 프로퍼티와 프로퍼티 감시자는 전역변수와 지역변수 모두에 사용할 수 있습니다.
 */
print("\n프로퍼티 전역변수")
var wonInPoket: Int = 2000{
    willSet{
        print("주머니에 돈이 \(wonInPoket)원에서 \(newValue)원으로 변경될 예정입니다.")
    }
    didSet{
        print("주머니에 돈이 \(oldValue)원에서 \(wonInPoket)으로 변경되었습니다.")
    }
}
var dollarInPoket: Double{
    get{
        return Double(wonInPoket) / 1000.0
    }
    set {
        wonInPoket = Int(newValue * 1000)
        print("주머니의 달러를\(newValue)달러로 변경 중입니다.")
    }
}
dollarInPoket = 3.5

//MARK: - 타입 프로퍼티
/*
 각각의 인스턴스가 아닌 타입 자체에 속하는 프로퍼티를 타입프로퍼티라고 합니다.
 인스터스의 생성 여부와 상관없이 타입 프로퍼티의 값은 하나며, 그 타입의 모든 인스턴스가 공통으로 사용하는 값,
 모든 인스턴스에서 공용으로 접근하고 값을 변경할 수 있는 변수 등을 정의할 때 유용합니다.
 */

class AClass{
    // 저장 타입 프로퍼티
    static var typeProperty: Int = 0
    
    // 저장 인스턴스 프로퍼티
    var instanceProperty: Int = 0{
        didSet{
            // Self.typeProperty는
            // AClass.typePropery와 같은 표현입니다.
            Self.typeProperty = instanceProperty + 100
        }
    }
    // 연산 타입 프로퍼티
    static var typeComputedProperty: Int {
        get{
            return typeProperty
        }
        set {
            typeProperty = newValue
        }
    }
}

AClass.typeProperty = 123

let classInstance: AClass = AClass()
classInstance.instanceProperty = 100

print(AClass.typeProperty)
print(AClass.typeComputedProperty)

//MARK: - 키 경로 (Key Path)
/*
 키 경로는 값을 바로 꺼내오는 것이 아니라 어떤 프로퍼티의 위치만 참조하도록 할 수 있습니다.
 키 경로를 사용하여 간접적으로 특정 타입의 어떤 프로퍼티 값을 가리켜야 할지 미리 지정해두고 사용할 수 있습니다.
 키 경로의 타입은 AnyKeyPath라는 클래스로부터 파생됩니다.
 제일 많이 확장된 키경로 타입은
 WritableKeyPath<Root, Value> : 값 타입에 키 경로 타입으로 읽고 쓸 수 있는 경우에 적용
 ReferenceWritableKeyParh<Root, Value> : 참조 타입, 즉 클래스 타입에 키 경로 타입으로 읽고 쓸 수 있는 경우에 적용
 \타입이름.경로.경로.경로
 = 여기서 경로는 프로퍼티 이름이라고 생각하면 됩니다.
 */

//MARK: 키 경로 타입의 타입 확인
class KeyPerson {
    var name: String
    
    init(name: String){
        self.name = name
    }
}
struct Stuff {
    var name: String
    var owner: KeyPerson
}
print(type(of: \KeyPerson.name)) // ReferenceWritableKeyPath<KeyPerson, String>
print(type(of: \Stuff.name)) // WritableKeyPath<Stuff, String>
