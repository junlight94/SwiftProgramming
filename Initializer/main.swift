//MARK: 인스턴스 생성과 소멸
import Foundation

//MARK: - 인스턴스 생성
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


//MARK: - 프로퍼티 기본값
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

//MARK: - 이니셜라이저 매개변수
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

//MARK: - 옵셔널 프로퍼티 타입
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

//MARK: - 상수 프로퍼티
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

//MARK: - 기본 이니셜라이저와 멤버와이즈 이니셜라이저
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

//MARK: - 초기화 위임
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

//MARK: - 실패 가능한 이니셜라이저

/*
 이니셜라이저를 통해 인스턴스를 초기화할 수 없는 여러 가지 예외 상황이 있습니다.
 대표적으로 이니셜라이저의 전달인자로 잘못된 값이나 적절치 못한 값이 전달되었을 때, 이니셜라이저 초기화에 실패할 수 있습니다.
 그 외에도 여러 이유로 인스턴스 초기화에 실패할 수 있습니다.
 이니셜라이저를 정의할 때 이런 실패 가능성을 염두에 두기도 하는데, 이렇게 실패 가능성을 내포한 이니셜라이저를 실패 가능한 이니셜라이저(Failable initalizer)라고 부릅니다.
 실패 가능한 이니셜라이저는 클래스, 구조체, 열거형 등에모두 정의할 수 있습니다. 실패 가능한 이니셜라이저는 실패했을 때 nil을 반환해주므로
 반환 타입이 옵셔널로 지정됩니다. 따라서 실패 가능한 이니셜라이저는 init 대신에 init? 키워드를 사용합니다.
 */

class FailPerson {
    let name: String
    var age: Int?
    
    init?(name: String){
        
        if name.isEmpty {
            return nil
        }
        
        self.name = name
    }
    
    init?(name:String, age: Int) {
        if name.isEmpty || age < 0{
            return nil
        }
        self.name = name
        self.age = age
    }
}

let failJun: FailPerson? = FailPerson(name: "junlight", age: 99)

if let person: FailPerson = failJun {
    print(person.name)
} else {
    print("Person wasn't initalized")
}
//junlight

let chope: FailPerson? = FailPerson(name: "chope", age: -10)

if let person: FailPerson = chope {
    print(person.name)
} else {
    print("Person wasn't initalized")
}
//Person wasn't initalized

let eric: FailPerson? = FailPerson(name: "", age: 30)

if let person: FailPerson = chope {
    print(person.name)
} else {
    print("Person wasn't initalized")
}
//Person wasn't initalized

//MARK: - 열거형의 실패 가능한 이니셜라이저
/*
 실패 가능한 이니셜라이저는 열거형에서 유용하게 사용할 수 있습니다.
 특정 case에 맞지 않는 값이 들어오면 생성에 실패할 수 있습니다. 혹은 rawValue로 초기화할 때,
 잘못된 rawValue가 전달되어 들어온다면 열거형 인스턴스를 생성하지 못할 수 있습니다. 따라서
 rawValue를 통한 이니셜라이저는 기본적으로 실패 가능한 이니셜라저로 제공됩니다.
 */

enum EStudent: String {
    case eElementary = "초등학생", eMiddle = "중학생", eHigh = "고등학생"
    
    init?(eKoreanAge: Int) {
        switch eKoreanAge {
        case 8...13:
            self = .eElementary
        case 14...16:
            self = .eMiddle
        case 17...19:
            self = .eHigh
        default:
            return nil
        }
    }
    
    init?(eBorn: Int, eYear: Int) {
        self.init(eKoreanAge: eYear - eBorn + 1)
    }
}

var young: EStudent? = EStudent(eKoreanAge: 20)
print(young) //nil

young = EStudent(eBorn: 2020, eYear: 2016)
print(young) //nil

young = EStudent(rawValue: "대학생")
print(young) //nil

young = EStudent(rawValue: "고등학생")
print(young) //high

//MARK: - 함수를 사용한 프로퍼티 기본값 설정
/*
 만약 사용자 정의 연산을 통해 저장 프로퍼티 기본값을 설정하고자 한다면 클로저나 함수를 사용하여
 프로퍼티 기본값을 제공할 수 있습니다. 인스턴스를 초기화할 때 함수나 클로저가 호출되면서
 연산 결괏값을 프로퍼티 기본값으로 제공해줍니다. 그렇기 때문에 클로저나 함수의 반환 타입은 프로퍼티의 타입과 일치해야 합니다.
 만약 프로퍼티 기본값을 성정해주기 위해서 클로저를 사용한다면 클로저가 실행되는 시점은 초기화할 때
 인스턴스의 다른 프로퍼티 값이 설정되기 전이라는 것도 명심해야 합니다. 즉, 클로저 내부에서는
 인스턴스의 다른 프로퍼티를 사용하여 연산할 수는 없다는 것입니다.
 또한, 클로저 내부에서 self 프로퍼티도 사용할 수 없으며, 이스턴스 메서드를 호출할 수도 없습니다.
 */

//class funcClass{
//    let someProperty: SomeType = {
//        // 새로운 인스턴스를 생성하고 사용자 정의 연산을 통한 후 반환해줍니다.
//        // 반환되는 값의 타입은 SomeType과 같은 타입이어야 합니다.
//        return someValue
//    }()
//}

struct FuncStudent {
    var name: String?
    var number: Int?
}

class SchoolClass {
    var student: [FuncStudent] = {
        // 새로운 인스턴스를 생성하고 사용자 정의 연산을 통한 후 반환해줍니다.
        // 반환되는 값의 타입은 [FuncStudent] 타입이여야 합니다.
        var arr: [FuncStudent] = [FuncStudent]()
        
        for num in 1...15 {
            var student: FuncStudent = FuncStudent(name: nil, number: num)
            arr.append(student)
        }
        return arr
    }()
}

let myClass: SchoolClass = SchoolClass()
print(myClass.student.count) // 15

//MARK: - 인스턴스 소멸
/*
 클래스의 인스턴스는 디이니셜라이저를 구현할 수 있습니다. 디이니셜라이저는 이니셜라이저와 반대 역할을 합니다.
 즉, 메모리에서 해제되기 직전 클래스 인스턴와 관련하여 원하는 정리 작업을 구현할 수 있습니다.
 디이니셜라이저는 클래스의 인스턴스가 메모리에서 소멸되기 바로 직전에 호출됩니다. deinit 키워드를 사용하여 디이니셜라이저를 구현하면
 자동으로 호출됩니다. 디이니셜라이저는 클래스의 인스턴스에만 구현할 수 있습니다.
 */

class DeinitClass {
    deinit{
        print("Instance will be deallocated immediately")
    }
}
var instance: DeinitClass? = DeinitClass()
instance = nil // Instance will be deallocated immediately

class FileManager {
    var fileName: String
    
    init(fileName: String) {
        self.fileName = fileName
    }
    
    func openFile(){
        print("open")
    }
    
    func modifyFile(){
        print("modify")
    }
    
    func writeFile(){
        print("write")
    }
    
    func closeFile(){
        print("close")
    }
    
    deinit{
        print("Deinit instance")
        self.writeFile()
        self.closeFile()
    }
}

var fileManager: FileManager? = FileManager(fileName: "abc.text")

if let manager: FileManager = fileManager {
    manager.openFile() // open
    manager.modifyFile() //modify
}

fileManager = nil
// Deinit instance
// write
// close
