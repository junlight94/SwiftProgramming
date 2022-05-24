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

