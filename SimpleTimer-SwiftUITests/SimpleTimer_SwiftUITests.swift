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
    
    func test() {
        let converter = container.resolve(InputConverterProtocol.self)!
        let actual = converter.convert(["1", "40", "5"])
        let expected = Date().addingTimeInterval(TimeInterval(1*60*60 + 40*60 + 5))
        XCTAssert(Calendar.current.isDate(expected, equalTo: actual, toGranularity: .second))
    }
}
