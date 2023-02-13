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

    func testHeroesCount() {
        let expectations = expectation(description: "testHeroesCount")
        let service = MockService()
        let viewModel = HomeViewModel(repository: MockMarvelRepository(service: service))
        
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
    
    func testGetHeroName() {
        let expectations = expectation(description: "testGetHeroName")
        let service = MockService()
        let viewModel = HeroViewModel(repository: MockMarvelRepository(service: service))
        
        viewModel.getData(for: 1)
            .asObservable()
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { character, _, _, _, _ in
                XCTAssertEqual("Absorbing Man", character?.name)
                expectations.fulfill()
            }, onError: { _ in
                XCTFail("Shouldn't have failed")
                expectations.fulfill()
            }).disposed(by: disposeBag)
        
        waitForExpectations(timeout: 5)
    }
    
    func testGetComics() {
        let expectations = expectation(description: "testGetComics")
        let service = MockService()
        let viewModel = HeroViewModel(repository: MockMarvelRepository(service: service))
        
        viewModel.getData(for: 1)
            .asObservable()
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { _, comics, _, _, _ in
                XCTAssertEqual(20, comics?.count)
                expectations.fulfill()
            }, onError: { _ in
                XCTFail("Shouldn't have failed")
                expectations.fulfill()
            }).disposed(by: disposeBag)
        
        waitForExpectations(timeout: 5)
    }
    
    func testGetEvents() {
        let expectations = expectation(description: "testGetEvents")
        let service = MockService()
        let viewModel = HeroViewModel(repository: MockMarvelRepository(service: service))
        
        viewModel.getData(for: 1)
            .asObservable()
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { _, _, events, _, _ in
                XCTAssertEqual(4, events?.count)
                expectations.fulfill()
            }, onError: { _ in
                XCTFail("Shouldn't have failed")
                expectations.fulfill()
            }).disposed(by: disposeBag)
        
        waitForExpectations(timeout: 5)
    }
    
    func testGetStories() {
        let expectations = expectation(description: "testGetStories")
        let service = MockService()
        let viewModel = HeroViewModel(repository: MockMarvelRepository(service: service))
        
        viewModel.getData(for: 1)
            .asObservable()
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { _, _, _, stories, _ in
                XCTAssertEqual(20, stories?.count)
                expectations.fulfill()
            }, onError: { _ in
                XCTFail("Shouldn't have failed")
                expectations.fulfill()
            }).disposed(by: disposeBag)
        
        waitForExpectations(timeout: 5)
    }
    
    func testGetSeries() {
        let expectations = expectation(description: "testGetSeries")
        let service = MockService()
        let viewModel = HeroViewModel(repository: MockMarvelRepository(service: service))
        
        viewModel.getData(for: 1)
            .asObservable()
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { _, _, _, _, series in
                XCTAssertEqual(20, series?.count)
                expectations.fulfill()
            }, onError: { _ in
                XCTFail("Shouldn't have failed")
                expectations.fulfill()
            }).disposed(by: disposeBag)
        
        waitForExpectations(timeout: 5)
    }

}
