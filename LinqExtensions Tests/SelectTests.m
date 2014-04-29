//
//  SelectTests.m
//  LinqExtensions
//
//  Created by Grayson Hansard on 4/29/14.
//  Copyright (c) 2014 From Concentrate Software. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TestObject.h"
#import "NSArray+Linq.h"

@interface SelectTests : XCTestCase
@property (nonatomic, strong) NSArray *array;
@end

@implementation SelectTests

- (void)setUp
{
    [super setUp];
	
	TestObject *t1 = [TestObject new];
	TestObject *t2 = [TestObject new];
	TestObject *t3 = [TestObject new];
	
	t1.content = @(1);
	t2.content = @(2);
	t3.content = @(3);
	
	self.array = @[t1, t2, t3];
}

- (void)testSelect
{
	NSEnumerator *enumerator = self.array.select(^(TestObject *o) { return o.content; });
	XCTAssertEqualObjects(@(1), [enumerator nextObject], @"");
	XCTAssertEqualObjects(@(2), [enumerator nextObject], @"");
	XCTAssertEqualObjects(@(3), [enumerator nextObject], @"");
}

@end
