//
//  LastTests.m
//  LinqExtensions
//
//  Created by Grayson Hansard on 5/5/14.
//  Copyright (c) 2014 From Concentrate Software. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSArray+Linq.h"
#import "LinqExceptions.h"

@interface LastTests : XCTestCase

@end

@implementation LastTests

- (void)testLast
{
	NSArray *array = @[ @(1), @(2), @(3) ];
	XCTAssertEqualObjects(@(3), array.last(nil), @"");
}

- (void)testLastWithBlock
{
	NSArray *array = @[ @(1), @(2), @(3) ];
	XCTAssertEqualObjects(@(2), array.last(^(NSNumber *n) { return [n unsignedIntegerValue] == 2; }), @"");
}

- (void)testLastException
{
	NSArray *array = @[];
	XCTAssertThrowsSpecificNamed(array.last(nil), NSException, InvalidOperationExceptionName, @"");
}

- (void)testLastExceptionWithBlock
{
	NSArray *array = @[@(1)];
	XCTAssertThrowsSpecificNamed(array.last(^(NSNumber *n) { return [n unsignedIntegerValue] != 1; }), NSException, InvalidOperationExceptionName, @"");
}

@end
