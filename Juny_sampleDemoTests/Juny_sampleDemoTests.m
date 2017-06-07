//
//  Juny_sampleDemoTests.m
//  Juny_sampleDemoTests
//
//  Created by sy on 2017/5/12.
//  Copyright © 2017年 Juny. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BannerViewController.h"
@interface Juny_sampleDemoTests : XCTestCase
@property (nonatomic, strong) BannerViewController *bannerVC;
@end

@implementation Juny_sampleDemoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _bannerVC = [[UIViewController alloc]init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
 
   
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

#pragma mark --------------------private-------------------------


- (void)testPercentageCalculator{
//    XCTAssert(true);
//测试VC的某个
//    let p = vc.percentage(50, 50)
//    XCTAssert(p == 25)
    
    XCTAssert(YES,"到底是个什么鬼");
}




@end
