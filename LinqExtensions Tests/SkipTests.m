//
//  SkipTests.m
//  LinqExtensions
//
//  Created by Grayson Hansard on 5/5/14.
//  Copyright (c) 2014 From Concentrate Software. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSArray+Linq.h"

@interface SkipTests : XCTestCase

@end

@implementation SkipTests

- (void)testSkip
{
	NSArray *array = @[ @(1), @(2), @(3) ];
	XCTAssertEqualObjects(@(3), [array.skip(2) nextObject], @"");
}

- (void)testSkipOvershoot
{
	NSArray *array = @[ @(1), @(2), @(3) ];
	XCTAssertEqualObjects(nil, [array.skip(3) nextObject], @"");
}

@end
