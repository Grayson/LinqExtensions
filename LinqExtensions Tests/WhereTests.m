//
//  WhereTests.m
//  LinqExtensions
//
//  Created by Grayson Hansard on 4/29/14.
//  Copyright (c) 2014 From Concentrate Software. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSArray+Linq.h"
#import "NSEnumerator+Linq.h"
#import "TestObject.h"

@interface WhereTests : XCTestCase

@end

@implementation WhereTests

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

- (void)testSimpleWhere
{
	TestObject *t1 = [TestObject new];
	TestObject *t2 = [TestObject new];
	
	t1.content = @(1);
	t2.content = @(2);
	
	NSEnumerator *e = @[t1, t2].where(^(TestObject *o) { return [o.content intValue] % 2 == 0; });
	XCTAssertEqualObjects(t2, [e nextObject], @"");
}

@end
