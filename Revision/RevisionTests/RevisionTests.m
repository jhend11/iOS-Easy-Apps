//
//  RevisionTests.m
//  RevisionTests
//
//  Created by JOSH HENDERSHOT on 8/7/14.
//  Copyright (c) 2014 Joshua Hendershot. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface RevisionTests : XCTestCase

@end

@implementation RevisionTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testForLoops
{
    int sum = 0;
    
    for (int i=0; i < 5; i++)
    {
        sum = sum + i;
    }
//    NSLog(@"Hello, World %d", sum);
    
    XCTAssertEqual(sum, 10, @"testing sum of ints");

}

@end
