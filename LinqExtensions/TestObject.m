//
//  TestObject.m
//  LinqExtensions
//
//  Created by Grayson Hansard on 4/29/14.
//  Copyright (c) 2014 From Concentrate Software. All rights reserved.
//

#import "TestObject.h"

@implementation TestObject

- (NSString *)description
{
	return [NSString stringWithFormat:@"<%@ (%@)>", NSStringFromClass([self class]), self.content];
}

@end
