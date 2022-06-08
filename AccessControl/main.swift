//MARK: 접근제어

import Foundation

//MARK: 접근제어란
/*
 접근제어는 코드끼리 상호작용을 할 때 파일 간 또는 모듈 간에 접근을 제한할 수 있는 기능입니다.
 접근제어를 통해 코드의 상세 구현은 숨기고 허용된 기능만 사용하는 인터페이스를 제공할 수 있습니다.
 */

//MARK: 모듈과 소스파일
/*
 스위프트의 접근제어는 모듈과 소스파일을 기반으로 설계되었습니다. 모듈은 배포할코드의 묶음 단위입니다.
 통상 하나의 프레임워크나 라이브러리 또는 애플리케이션이 모듈 단위가 될 수 있습니다. 스위프트에서는 import 키워드를 사용해 불러옵니다.
 소스파일은 하나의 스위프트 소스 코드 파일을 의미합니다. 자바나 Objective-C와 같은 기존의 프로그래밍 언어에서는 통상 파일 하나에 타입을 하나만 정의합니다.
 스위프트에서도 보통 파일 하나에 타입 하나만 정의하지만, 때로는 소스파일 하나에 여러 타입이나 함수 등 많은 것을 정의하거나 구현할 수 있습니다.
 */

//MARK: 접근수준
/*
 접근제어는 접근수준 키워드를 통해 구현할 수 있습니다. 각 타입에 특정 접근수준을 지정할 수 있고,
 타입 내부의 프로퍼티, 메서드, 이니셜라이저, 서브스크립트 각각에도 접근수준을 지정할 수 있습니다.
 접근수준을 명시할 수 있는 키워드는 open, public, internal, fileprivate, private 다섯가지가 있습니다.
 */

//MARK: - 공개 접근수준 - public
/*
 public 키워드로 접근수준이 지정된 요소는 어디서든 쓰일 수 있습니다. 자신이 구현된 소스 파일은 물론,
 그 소스파일이 속해 있는 모듈을 가져다 쓰는 모듈 등 모든 곳에서 사용할 수 있습니다.
 공개 접근수준은 주로 프레임워크에서 외부와 연결될 인터페이스를 구현하는데 많이 쓰입니다.
 우리가 사용하는 스위프트의 기본 요소는 모두 공개 접근수준으로 구현되어 있다고 생각하면 됩니다.
 */

//MARK: - 개방 접근수준 - open
/*
 open 키워드로 지정할 수 있는 개방 접근수준은 공개 접근수준 이상으로 높은 접근수준이며,
 클래스와 클래스 멤버에서만 사용할 수 있습니다. 기본적으로 공개 접근수준과 비슷하지만 다음과 같은 차이점이 있습니다.
 - 개방 접근수준을 제외한 다른 모든 접근수준의 클래스는 그 클래스가 정의된 모듈 안에서만 상속할 수 있습니다.
 - 개반 접근수준을 제외한 다른 모든 접근수준의 클래스 멤버는 해당 멤버가 정의된 모듈 안에서만 재정의할 수 있습니다.
 - 개방 접근수준의 클래스는 그 클래스가 정의된 모듈 밖의 다른 모듈에서도 상속할 수 있습니다.
 - 개방 접근수준의 클래스 멤버는 해당 멤버가 정의된 모듈 밖의 다른 모듈에서도 재정의할 수 있습니다.
 */

//MARK: - 내부 접근수준 - internal
/*
 internal 키워드로 지정하는 내부 접근수준은 기복적으로 모든 요소에 암묵적으로 지정하는 기본 접근수준입니다.
 내부 접근수준으로 지정된 요소는 소스파일이 속해 있는 모듈 어디에서든 쓰일 수 있습니다.
 다만 그 모듈을 가져다 쓰는 외부 모듈에서는 접근할 수 없습니다. 보통 외부에서 사용할 클래스나 구조체가 아니며,
 모듈 내부에서 광역적으로 사용할 경우 내부 접근수준을 지정합니다.
 */

//MARK: - 파일외부비공개 접근수준 - fileprivate
/*
 파일외부비공개 접근수준으로 지정된 요소는 그 요소가 구현된 소스파일 내부에서만 사용할 수 있습니다.
 해당 소스파일 외부에서 값이 변경되거나 함수를 호출하면 부작용이 생길 수 있는 경우에 사용하면 좋습니다.
 */

//MARK: - 비공개 접근수준 - private
/*
 비공개 접근수준은 가장 한정적인 범위입니다. 비공개 접근수준으로 지정된 요소는 그 기능을 정의하고 구현한 범위 내에서만 사용할 수 있습니다.
 비공개 접근수준으로 지정한 기능은 심지어 같은 소스파일 안에 구현한 다른 타입이나 기능에서도 사용할 수 없습니다.
 */

//MARK: - 접근제어 참고사항
/*
 모든 타입에 적용되는 접근수준의 규칙은 '상위 요소보다 하위 요소가 더 높은 접근수준을 가질 수 없다' 입니다.
 */
private class Aclass {
    // 공개 접근수준을 부여해도 Aclass의 접근수준이 비공개 접근 수준이므로
    // 이 메서드의 접근수준도 비공개 접근수준으로 취급됩니다.
    public func someMethod(){
        // ...
    }
}

// Aclass의 접근수준이 비공개 접근수준이므로
// 공개 접근수준 함수나 매개변수나 값 타입으로 사용할 수 없습니다.
//public func someFunction(a: Aclass) -> Aclass { // 에러
//    return a
//}

// 접근수준에 따른 접근 결과

class Access {
    func internalMethod() {}
    fileprivate func filePrivateMethod() {}
    var internalProperty = 0
    fileprivate var filePrivateProperty = 0
}
let aInstance: Access = Access()
aInstance.internalMethod()          // 같은 모듈이므로 호출 가능
aInstance.filePrivateMethod()       // 다른 파일이므로 호출 불가 - 오류
aInstance.internalProperty = 1      // 같은 모듈이므로 접근 가능
aInstance.filePrivateProperty = 1   // 다른 파일이므로 호출 불가 - 오류

//MARK: - private와 fileprivate
/*
 같은 파일 내부에서 private 접근수준과 fileprivate 접근수준은 사용할 때 분명한 차이가 있습니다.
 fileprivate 접근수준으로 지정한 요소는 같은 파일 어떤 코드에서도 접근할 수 있습니다.
 
 반면에 private 접근수준으로 지정한 요소는 같은 파일 내부에 다른 타입의 코드가 있더라도 접근이 불가능합니다.
 그러나 자신을 확장하는 익스텐션 코드가 같은 파일에 존재하는 경우에는 접근할 수 있습니다.
 */
public struct SomeType {
    private var privateVariable = 0
    fileprivate var fileprivateVariable = 0
}

// 같은 타입의 익스텐션에서는 private 요소에 접근 가능
extension SomeType{
    public func publicMethod() {
        print("\(self.privateVariable), \(self.fileprivateVariable)")
    }
    private func privateMethod(){
        print("\(self.privateVariable), \(self.fileprivateVariable)")
    }
    fileprivate func fileprivateMethod(){
        print("\(self.privateVariable), \(self.fileprivateVariable)")
    }
}

struct AnotherType {
    var someInstance: SomeType = SomeType()
    
    mutating func someMethod() {
        // public 접근 수준에는 어디서든 접근 가능
        self.someInstance.publicMethod() // 0, 0
        
        // 같은 파일에 속해 있는 코드이므로 fileprivate 접근수준 요소에 접근 가능
        self.someInstance.fileprivateVariable = 100
        self.someInstance.fileprivateMethod() // 0, 100
        
        // 다른 타입 내부의 코드이므로 private 요소에 접근 불가, 오류!
        // self.someInstance.privateVariable = 100
        // self.someInstance.privateMethod()
    }
}

var anotherInstance = AnotherType()
anotherInstance.someMethod()

//MARK: - 읽기 전용 구현
/*
 구조체 또는 클래스를 사용하여 저장 프로퍼티를 구현할 때는 허용된 접근수준에서 프로퍼티 값을 가져갈 수 있습니다.
 그러면 값을 변경할 수 없도록 구현하고 싶다면 어떻게 해야 할까요?, 또 서브스크립트도 읽기만 가능하도록 제한하려면 어떻게 해야 할까요?
 그럴 때는 설정자만 더 낮은 접근수준을 갖도록 제한할 수 있습니다. 요소의 접근 수준 키워드 위에 (set)처럼 표현하면 설정자의 접근수준만 더 낮도록 지정해줄 수 있습니다.
 설정자 접근수준 제한은 프로퍼티, 서브스크립트, 변수 등에 적용될 수 있으며, 해당 요소의 접근수준보다 같거나 낮은 수준으로 제한해주어야 합니다.
 */

public struct ReadType{
    // 비공개 접근수준 저장 프로퍼티
    private var count: Int = 0
    
    // 공개 접근수준 정장 프로퍼티 publicSoredProperty
    public var publicStoredProperty: Int = 0
    
    // 공개 접근수준 저장 프로퍼티 PublicGetOnlyStoredProperty
    // 설정자는 비공개 접근수준
    public private(set) var PublicGetOnlyStoredProperty: Int = 0
    
    // 내부 접근수준 저장 프로퍼티 internalComputedProperty
    internal var internalComputedProperty: Int {
        get {
            return count
        }
        
        set {
            count += 1
        }
    }
    
    // 내부 접근수준 저장 프로퍼티 internalGetOnlyComputedProperty
    // 설정자는 비공개 접근수준
    internal private(set) var internalGetOnlyComputedProperty: Int {
        get {
            return count
        }
        
        set {
            count += 1
        }
    }
    
    //공개 접근수준 서브스크립트
    public subscript() -> Int {
        get {
            return count
        }
        
        set {
            count += 1
        }
    }
    
    // 공개 접근수준 서브스크립트
    // 설정자는 내부 접근수준
    public internal(set) subscript(some: Int) -> Int {
        get {
            return count
        }
        
        set {
            count += 1
        }
    }
}

var someInstance: ReadType = ReadType()

// 외부 접근자, 설정자 모두 사용 가능
print(someInstance.publicStoredProperty) //0
someInstance.publicStoredProperty = 100

// 외부에서 접근자만 사용 가능
print(someInstance.PublicGetOnlyStoredProperty) //0
//someInstance.PublicGetOnlyStoredProperty = 100 오류

// 외부에서 접근자, 설정자 모두 사용 가능
print(someInstance.internalComputedProperty) // 1
//someInstance.internalGetOnlyComputedProperty = 100 오류

// 외부에서 접근자만 사용 가능
print(someInstance.internalGetOnlyComputedProperty) // 1
//someInstance.internalGetOnlyComputedProperty = 100 오류

// 외부에서 접근자, 설정자 모두 사용 가능
print(someInstance[]) // 1
someInstance[] = 100

// 외부에서 접근자만, 같은 모듈 내에서는 서정자도 사용 가능
print(someInstance[0]) // 2
someInstance[0] = 100
