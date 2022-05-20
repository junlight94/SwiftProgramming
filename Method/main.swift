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
