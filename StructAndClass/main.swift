//MARK: 구조체와 클래스
import Foundation

/*
 구조체와 클래스는 프로그래머가 데이터를 용도에 맞게 묶어 표현하고자 할 때 유용합니다.
 구조체의 인스턴스는 값 타입이고, 클래스의 인스턴스는 참조 타입입니다.
 스위프트에서는 여러 개의 구조체와 여러 개의 클래스를 정의하고 구현해도 문제가 없습니다.
 중첩 함수와 마찬가지로 구조체 안에 구조체, 클래스 안에 클래스 등과 같이 중첩 타입의 정의 및 선언이 가능합니다.
 */


//MARK: - 구조체(Struct)
/*
 구조체는 struct 키워드로 정의합니다.
 */
struct BasicInformation {
    var name: String
    var age: Int
}

/*
 구조체 인스턴스의 생성 및 초기화
 구조체 정의를 마친 후, 인스턴스를 생성하고 초기화하고자 할 때는 기본적으로 멤버와이즈 이니셜라이저를 사용합니다.
 프로퍼티 값에 접근하고 싶다면 마침표(.)를 사용하면 됩니다.
 구조체 상수 let으로 선언하면 인스턴스 내부의 프로퍼티 값을 변경할 수 없고
 변수 var로 선언된 경우에 값을 변경해줄 수 있습니다.
 */

//프로퍼티 이름(name, age)으로 자동 생성된 이니셜라이저를 사용하여 구조체를 생성합니다.
var junlightInfo = BasicInformation(name: "junlihgt", age: 99)
junlightInfo.name = "Change"
junlightInfo.age = 1
print(junlightInfo)

//MARK: - 클래스

/*
 클래스는 class 키워드로 정의합니다.
 */

class Person {
    var height: Float = 0.0
    var weight: Float = 0.0
}

/*
 클래스 인스턴스의 생성 및 초기화
 인스턴스를 생성하고 초기화하고자 할 때는 기본적인 이니셜라이저를 사용합니다.
 Person 클래스에서는 프로퍼티의 기본값이 지정되어 있으므로 전달인자를 통하여 따로 초깃값을 전달해주지 않아도 됩니다.
 클래스는 구조체와는 다르게 클래스의 인스턴스는 참조 타입이므로 클래스의 인스턴스를 상수 let으로 선언해도
 내부 프로퍼티 값을 변경할 수 있습니다.
 */
var junlight: Person = Person()
junlight.height = 183.5
junlight.weight = 78

/*
 클래스 인스턴스의 소멸
 클래스의 인스턴스는 참조 타입이므로 더는 참조할 필요가 없을 때 메모리에서 해제됩니다.
 이 과정을 소멸이라고 하는데 소멸되기 직전 deinit라는 메서드가 호출됩니다.
 클래스 내부에 deinit 메서드를 구현해주면 소멸되기 직전 deinit 메서드가 호출됩니다.
 deinit 메서드는 클래스당 하나만 구현할 수 있으며, 매개변수와 반환 값을 가질 수 없습니다.
 */
class Man {
    var height: Float = 0.0
    var weight: Float = 0.0
    deinit {
        print("Man의 클래스 인스턴스가 소멸됩니다.")
    }
}
var jun: Man? = Man()
jun = nil

/*
 구조체와 클래스의 차이
 - 구조체는 상속할 수 없습니다.
 - 타입캐스팅은 클래스의 인스턴스에만 허용합니다.
 - 디이니셜라이저는 클래스의 인스턴스에만 활용할 수 있습니다.
 - 참조 횟수 계산은 클래스의 인스턴스에만 적용됩니다.
 */

/*
 값 타입과 참조 타입
 구조체는 값 타입이고 클래스틑 참조 타입입니다.
 둘의 가장 큰 차이는 '무엇이 전달되느냐' 입니다.
 예를 들어 함수의 전달인자로 값 타입의 값을 넘긴다면 전달될 값이 복사되어 전달 됩니다.
 그러나 참조 타입이 전달인자로 전달될 때는 값을 복사하지 않고 참조(주소)가 전달 됩니다.
 */

struct Information {
    var name: String
    var age: Int
}
var junInfo: Information = Information(name: "junlight", age: 29)

//값을 복사하여 할당
var friend: Information = junInfo
print("junInfo :", junInfo.age) // age: 29
print("friend : ", friend.age) // age: 29

friend.age = 28

print("junInfo :", junInfo.age) // 값 변동은 없습니다. age: 29
print("friend : ", friend.age) // age: 28

class InfoClass {
    var height: Float = 0.0
    var weight: Float = 0.0
}

var me: InfoClass = InfoClass()
var classfriend: InfoClass = me
print("me height : ", me.height) // 0.0
print("classfriend height : ", classfriend.height) // 0.0

classfriend.height = 183.5
print("me height : ", me.height) // friend는 me를 참조하기 때문에 값이 변합니다.
print("classfriend height : ", classfriend.height) // 둘다 값이 변한걸 확인할 수 있습니다.

/*
구조체와 클래스 선택해서 사용하기
 애플 가이드라인에서 다음 조건 중 하나 이상에 해당한다면 구조체를 사용하는 것을 권장합니다.
 - 연관된 간단한 값의 집합을 캡슐화하는 것만이 목적일 때
 - 캡슐화한 값을 참조하는 것보다 복사하는 것이 합당할 때
 - 구조체에 저장된 프로퍼티가 값 타입이며 참조하는 것보다 복사하는 것이 합당할 때
 - 다른 타입으로부터 상속 받거나 자신을 상속할 필요가 없을 때
 */
