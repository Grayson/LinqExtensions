//
//  AllTests.m
//  LinqExtensions
//
//  Created by Grayson Hansard on 4/29/14.
//  Copyright (c) 2014 From Concentrate Software. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSArray+Linq.h"
#import "NSEnumerator+Linq.h"
#import "TestObject.h"

@interface AllTests : XCTestCase

@end

@implementation AllTests

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

- (void)testSimpleAllTrue
{
	TestObject *t1 = [TestObject new];
	TestObject *t2 = [TestObject new];
	
	t1.content = @(1);
	t2.content = @(2);
	
	BOOL b = @[t1, t2].all(^(TestObject *o) { return [o.content intValue] < 100; });
	
	XCTAssertEqual(YES, b, @"");
}

- (void)testSimpleAllFalse
{
	TestObject *t1 = [TestObject new];
	TestObject *t2 = [TestObject new];
	
	t1.content = @(1);
	t2.content = @(2);
	
	BOOL b = @[t1, t2].all(^(TestObject *o) { return [o.content intValue] < 0; });
	
	XCTAssertEqual(NO, b, @"");
}

- (void)testSimpleAllPartial
{
	TestObject *t1 = [TestObject new];
	TestObject *t2 = [TestObject new];
	
	t1.content = @(1);
	t2.content = @(2);
	
	BOOL b = @[t1, t2].all(^(TestObject *o) { return [o.content intValue] < 2; });
	
	XCTAssertEqual(NO, b, @"");
}

@end
