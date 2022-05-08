//
//  main.swift
//  Operator
//
//  Created by Junyoung Lee on 2022/05/08.
//

import Foundation

//MARK: - 연산자의 종류

//MARK: 할당 연산자
// A = B : A의 값에 B를 할당합니다. 서로 다은 데이터 타입이면 오류

//MARK: 산술 연산자
/*
A + B : A와 B를 더한 값을 반환합니다.
A - B : A에서 B를 뺀 값을 반환합니다.
A * B : A와 B를 곱한 값을 반환합니다.
A / B : A를 B로 나눈 값을 반환합니다.
A % B : A를 B로 나눈 나머지를 반환합니다.
*/

//MARK: 비교 연산자
/*
 A == B : A와 B가 같은 값인지 비교하여 Boolean 값을 반환.
 A >= B : A가 B보다 크거나 같은 값인지 비교하여 Boolean 값을 반환.
 A <= B : A와 B보다 작거나 같은 값인지 비교하여 Boolean 값을 반환.
 A > B : A가 B보다 큰 값인지 비교하여 Boolean 값을 반환.
 A < B : A가 B보다 작은 값인지 비교하여 Boolean 값을 반환.
 A != B : A와 B가 다른 값인지 비교하여 Boolean 값을 반환.
 A === B : A와 B가 참조(레퍼런스) 타입일 때 같은 인스턴스를 가리키는지 비교하여 Boolean 값을 반환
 A !== B : A와 B가 참조(레퍼런스) 타입일 때 같지 않은 인스턴스를 가리키는지 비교하여 Boolean 값을 반환
 A ~= B : A와 B의 패턴이 매치되는지 확인하여 불리언 값을 반환합니다.
 */

//MARK: 삼항 조건 연산자
// Question ? A : B
// Question이 Boolean 값이 참이면 A, 거짓이면 B를 반환

//MARK: 범위 연산자
/*
폐쇄 범위 연산자 : A ... B (A부터 B까지 수를 묶어서 표현, A와 B를 포함)
반폐쇄 범위 연산자 : A ..< B (A부터 B 미만까지 수를 묶어 표현, B 미포함)
단방향 범위 연산자
A... (A 이상의 수)
...A (A 이하의 수)
..<A (A 미만의 수)
*/

//MARK: 부울 연산자
/*
!B : B의 참, 거짓을 반전합니다.
A && B : A와 B의 불리언 AND 논리 연산을 실행합니다.
A || B : A와 B의 불리언 OR 논리 연산을 실행합니다.
*/
