//
//  SkipWhileTests.m
//  LinqExtensions
//
//  Created by Grayson Hansard on 5/5/14.
//  Copyright (c) 2014 From Concentrate Software. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSArray+Linq.h"

@interface SkipWhileTests : XCTestCase

@end

@implementation SkipWhileTests

- (void)testSkipWhile
{
	NSArray *array = @[ @(1), @(2), @(3) ];
	NSEnumerator *enumerator = array.skipWhile(^(NSNumber *n) { return [n unsignedIntegerValue] < 2; });
	XCTAssertEqualObjects(@(3), [enumerator nextObject], @"");
}

- (void)testSkipWhileReturningNil
{
	NSArray *array = @[ @(1), @(2), @(3) ];
	NSEnumerator *enumerator = array.skipWhile(^(NSNumber *n) { return [n unsignedIntegerValue] < 100; });
	XCTAssertNil([enumerator nextObject], @"");
}

@end
