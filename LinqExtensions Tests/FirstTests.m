//
//  FirstTests.m
//  LinqExtensions
//
//  Created by Grayson Hansard on 5/4/14.
//  Copyright (c) 2014 From Concentrate Software. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSArray+Linq.h"
#import "LinqExceptions.h"

@interface FirstTests : XCTestCase

@end

@implementation FirstTests

- (void)testFirst
{
	NSArray *array = @[ @(1), @(2), @(3) ];
	XCTAssertEqualObjects(@(1), array.first(nil), @"");
}

- (void)testFirstWithBlock
{
	NSArray *array = @[ @(1), @(2), @(3) ];
	XCTAssertEqualObjects(@(2), array.first(^(NSNumber *n) { return [n unsignedIntegerValue] == 2; }), @"");
}

- (void)testFirstException
{
	NSArray *array = @[];
	XCTAssertThrowsSpecificNamed(array.first(nil), NSException, InvalidOperationExceptionName, @"");
}

- (void)testFirstExceptionWithBlock
{
	NSArray *array = @[@(1)];
	XCTAssertThrowsSpecificNamed(array.first(^(NSNumber *n) { return [n unsignedIntegerValue] != 1; }), NSException, InvalidOperationExceptionName, @"");
}

@end
