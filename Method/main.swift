//MARK: - 메서드(Method)
import Foundation

/*
 메서드는 특정 타입에 관련된 함수를 뜻합니다.
 클래스, 구조체, 열거형 등을 실행하는 기능을 캡슐화한 인스턴스 메서드를 정의할 수 있습니다.
 타입 자체와 관련된 기능을 실행하는 타입 메서드를 정의할 수도 있습니다.
 */

//MARK: 인스턴스 메서드(Instance Method)
/*
 인스턴스 메서드는 특정 아입의 인스터스에 속한 함수를 뜻합니다.
 인스턴스 메서드는 함수와 달리 특정 타입 내부에 구현합니다. 따라서 인스턴스가 존재할 때만 사용할 수 있습니다.
 이점이 함수와 유일한 차이점입니다.
 */

//MARK: 클래스 인스턴스의 메서드
class LevelClass {
    // 현재 레벨을 저장하는 프로퍼티
    var level: Int = 0 {
        // 프로퍼티 감시자
        didSet{
            print("Level \(level)")
        }
    }
    // 레벨이 올랐을 때 호출하는 메서드
    func levelUP(){
        print("Level UP!")
        level += 1
    }
    // 레벨이 떨어졌을 때 호출하는 메서드
    func levelDown(){
        print("Level Dwon")
        level -= 1
        if level < 0 {
            reset()
        }
    }
    // 특정 레벨로 이동할 때 호출할 메서드
    func junpLevel(to: Int){
        print("Jump to \(to)")
        level = to
    }
    // 레벨을 초기화할 때 호출할 메서드
    func reset(){
        print("Reset!")
        level = 0
    }
}

var levelClassInstance: LevelClass = LevelClass()

levelClassInstance.levelUP() // Level UP! / Level 1
levelClassInstance.levelDown() // Level Down / Level 0
levelClassInstance.levelDown() // Level Down / Level -1 / Reset! / Level 0
levelClassInstance.junpLevel(to: 30) // Jump to 30 / Level 30

//MARK: mutating 키워드 사용
/*
 LevelClass의 인스턴스 메서드 level 인스턴스 프로퍼티의 값을 수정하는 코드가 있습니다.
 자신의 프로퍼티 값을 수정할 때 클래스의 인스턴스 메서드는 크게 신경 쓸 필요가 없지만,
 구조체나 열거형 등은 값 타입이므로 메서드 앞에 mutating 키워드를 붙여 해당 메서드가 인스턴스 내부의 값을 변경한다는 것을 명시해야 합니다.
 */
struct LevelStruct {
    var level: Int = 0{
        didSet{
            print("Level \(level)")
        }
    }

    mutating func levelUP(){
        print("Level UP!")
        level += 1
    }

    mutating func levelDown(){
        print("Level Dwon")
        level -= 1
        if level < 0 {
            reset()
        }
    }

    mutating func junpLevel(to: Int){
        print("Jump to \(to)")
        level = to
    }

    mutating func reset(){
        print("Reset!")
        level = 0
    }
}
var levelStructInstance: LevelStruct = LevelStruct()
levelStructInstance.levelUP() // Level UP! / Level 1
levelStructInstance.levelDown() // Level Down / Level 0
levelStructInstance.levelDown() // Level Down / Level -1 / Reset! / Level 0
levelStructInstance.junpLevel(to: 30) // Jump to 30 / Level 30

//MARK: self 프로퍼티
/*
 모든 인스턴스는 암시적으로 생성된 self 프로퍼티를 갖습니다. self는 자기 자신을 가르키는 프로퍼티 입니다.
 self 프로퍼티는 인스턴스를 더 명확히 지칭하고 싶을 때 사용합니다.
 level변수를 사용할 때, 스위프트는 자동으로 메서드 내부에 선언된 지역변수를 먼저 사용하고,
 그다음 메서드 매개변수, 그다음 인스턴스의 프로퍼티를 찾아서 level이 무엇을 지칭하는지 유추합니다.
 그런데 메서드 매개변수의 이름이 level인데, 이 level매개변수가 아닌 인스턴스 프로퍼티인 level을 지칭하고 싶다면
 self 프로퍼티를 사용합니다.
 */

class SelfLevel {
    var level: Int = 0
    
    func junpLevel(level: Int){
        print("Jump to \(level)")
        self.level = level
    }
}

//MARK: 타입 메서드
/*
 메서드에는 인스턴스 메서드와 타입 메서드가 있습니다.
 타입 자체에 호출이 가능한 메서드를 타입 메서드라고 부릅니다.
 메서드 앞에 static 키워드를 사용하여 타입 메서드임을 나타내줍니다.
 클래스 타입 메서드는 static 키워드와 class 키워드를 사용할 수 있는데
 static으로 정의하면 상속 후 메서드 재정의가 불가능하고
 class로 정의하면 상속 후 메서드 재정의가 가능합니다.
 */

class AClass {
    static func staticTypeMethod() {
        print("AClass staticTypeMethod")
    }
    class func classTypeMethod() {
        print("AClass classTypeMethod")
    }
}

class BClass: AClass{
    /*
     // 오류 발생, 재정의 불가
     override static func statiTypeMethod(){
     }
     */
    override class func classTypeMethod() {
        print("BClass classTypeMethod")
    }
}

AClass.staticTypeMethod()
AClass.classTypeMethod()
BClass.classTypeMethod()

//MARK: 타입 프로퍼티와 타입 메서드의 사용
/*
 타입 메서드는 인스턴스 메서드와는 달리 self 프로퍼티가 타입 그 자체를 가리킨다는 점이 다릅니다.
 인스턴스 메서드에는 self가 인스턴스를 가리킨다면 타입 메서드의 self는 타입을 가리킵니다.
 그래서 타입 메서드 내부에서 타입 이름과 self는 같은 뜻이라고 볼 수 있습니다.
 그래서 타입 메서드에서 self 프로퍼티를 사용하면 타입 프로퍼티 및 타입 메서드를 호출할 수 있습니다.
 */

// 시스템 음량은 한 기기에서 유일한 값이어야 합니다.
struct SystemVolume {
    // 타입 프로퍼티를 사용하면 언제나 유일한 값이 됩니다.
    static var volume: Int = 5
    
    // 타입 프로퍼티를 제어하기 위해 메서드를 사용합니다.
    static func mute() {
        self.volume = 0 // SystemVolume.volume = 0 과 같은 표현입니다.
    }
}

// 내비게이션 역할은 여러 인스턴스가 수행할 수 있습니다.
class Navigation {
    
    // 내비게이션 인스턴스마다 음량을 따로 설정할 수 있습니다.
    var volume: Int = 5
    
    // 길 안내 음성 재생
    func guideWay() {
        SystemVolume.mute()
    }
    
    // 길 안내 음성 종료
    func finishGuideWay() {
        // 기존 재생원 음량 복구
        SystemVolume.volume = self.volume
    }
}

SystemVolume.volume = 10

let myNavi: Navigation = Navigation()

myNavi.guideWay()
print(SystemVolume.volume) // 0

myNavi.finishGuideWay()
print(SystemVolume.volume) // 5
