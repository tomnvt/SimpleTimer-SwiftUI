//
//  SimpleTimer_SwiftUITests.swift
//  SimpleTimer-SwiftUITests
//
//  Created by Tomáš Novotný on 21/03/2020.
//  Copyright © 2020 Nvt. All rights reserved.
//

import Swinject
import XCTest
@testable import SimpleTimer_SwiftUI

class InputConverterTests: XCTestCase {

    let container = ContainerBuilder.buildContainer()

    lazy var converter = container.resolve(InputConverterProtocol.self)!
    
    func test_ConvertStringsToDate() {
        let expected = Date().addingTimeInterval(TimeInterval(1*60*60 + 40*60 + 5))
        let actual = converter.convert(["1", "40", "5"])
        XCTAssert(Calendar.current.isDate(expected, equalTo: actual, toGranularity: .second))
    }

    func test_ConvertDateToStrings() {
        let expected = ["01", "01", "01"]
        let actual = converter.convert(Date().addingTimeInterval(3661))
        XCTAssertEqual(actual, expected)
    }
}
