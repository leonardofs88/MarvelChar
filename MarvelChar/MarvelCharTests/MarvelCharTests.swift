//
//  MarvelCharTests.swift
//  MarvelCharTests
//
//  Created by Leonardo Soares on 04/02/23.
//

import XCTest
import RxSwift
@testable import MarvelChar

final class MarvelCharTests: XCTestCase {
    
    lazy var disposeBag = DisposeBag()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchingHeroName() {
        let expectations = expectation(description: "testFetchingHeroName")
        let viewModel = HomeViewModel(repository: MockMarvelRepository())
        
        viewModel.characters
            .asObservable()
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { characters in
                XCTAssertEqual(20, characters.count)
                expectations.fulfill()
            }, onError: { _ in
                XCTFail("Shouldn't have failed")
                expectations.fulfill()
            }).disposed(by: disposeBag)
        
        viewModel.getCharacters(page: 10)
        waitForExpectations(timeout: 5)
    }

}
