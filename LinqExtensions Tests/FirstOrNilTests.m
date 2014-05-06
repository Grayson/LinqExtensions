//
//  FirstOrNilTests.m
//  LinqExtensions
//
//  Created by Grayson Hansard on 5/4/14.
//  Copyright (c) 2014 From Concentrate Software. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSArray+Linq.h"
#import "LinqExceptions.h"

@interface FirstOrNilTests : XCTestCase

@end

@implementation FirstOrNilTests

- (void)testFirstOrNil
{
	NSArray *array = @[];
	XCTAssertNil(array.firstOrNil(NULL), @"");
}

- (void)testFirstOrNilWithBlock
{
	NSArray *array = @[ @(1), @(2), @(3) ];
	XCTAssertEqualObjects(@(2), array.firstOrNil(^(NSNumber *n) { return [n unsignedIntegerValue] == 2; }), @"");
}

- (void)testFirstOrNilReturningNilWithBlock
{
	NSArray *array = @[ @(1), @(2), @(3) ];
	XCTAssertNil(array.firstOrNil(^(NSNumber *n) { return [n unsignedIntegerValue] > 100; }), @"");
}

@end
