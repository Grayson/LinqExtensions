//
//  LastOrNilTests.m
//  LinqExtensions
//
//  Created by Grayson Hansard on 5/5/14.
//  Copyright (c) 2014 From Concentrate Software. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSArray+Linq.h"
#import "LinqExceptions.h"

@interface LastOrNilTests : XCTestCase

@end

@implementation LastOrNilTests

- (void)testLastOrNil
{
	NSArray *array = @[@(1), @(2), @(3)];
	XCTAssertEqualObjects(@(3), array.lastOrNil(NULL), @"");
}

- (void)testLastOrNilReturningNil
{
	NSArray *array = @[];
	XCTAssertNil(array.lastOrNil(NULL), @"");
}

- (void)testLastOrNilWithBlock
{
	NSArray *array = @[ @(1), @(2), @(3) ];
	XCTAssertEqualObjects(@(2), array.lastOrNil(^(NSNumber *n) { return [n unsignedIntegerValue] == 2; }), @"");
}

- (void)testLastOrNilReturningNilWithBlock
{
	NSArray *array = @[ @(1), @(2), @(3) ];
	XCTAssertNil(array.lastOrNil(^(NSNumber *n) { return [n unsignedIntegerValue] > 100; }), @"");
}

@end
