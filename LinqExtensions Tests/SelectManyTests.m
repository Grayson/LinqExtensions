//
//  SelectManyTests.m
//  LinqExtensions
//
//  Created by Grayson Hansard on 4/30/14.
//  Copyright (c) 2014 From Concentrate Software. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSArray+Linq.h"
#import "TestObject.h"

@interface SelectManyTests : XCTestCase

@end

@implementation SelectManyTests

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

- (void)testExample
{
	TestObject *t1 = [TestObject new];
	TestObject *t2 = [TestObject new];
	
	t1.content = @[ @(1), @(2), @(3) ];
	t2.content = @[ @(4), @(5), @(6) ];
	
	NSEnumerator *e = @[ t1, t2 ].selectMany(^(TestObject *o) { return o.content; });
	XCTAssertEqualObjects(@(1), [e nextObject], @"");
	XCTAssertEqualObjects(@(2), [e nextObject], @"");
	XCTAssertEqualObjects(@(3), [e nextObject], @"");
	XCTAssertEqualObjects(@(4), [e nextObject], @"");
	XCTAssertEqualObjects(@(5), [e nextObject], @"");
	XCTAssertEqualObjects(@(6), [e nextObject], @"");
}

@end
