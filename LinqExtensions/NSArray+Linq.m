//
//  NSArray+Linq.m
//  LinqExtensions
//
//  Created by Grayson Hansard on 4/29/14.
//  Copyright (c) 2014 From Concentrate Software. All rights reserved.
//

#import "NSArray+Linq.h"

@implementation NSArray (Linq)

- (LinqSelectBlock)select
{
	return CreateLinqSelectBlock([self objectEnumerator]);
}

- (LinqWhereBlock)where
{
	return CreateLinqWhereBlock([self objectEnumerator]);
}

- (LinqAnyBlock)any
{
	return CreateLinqAnyBlock([self objectEnumerator]);
}

- (LinqAllBlock)all
{
	return CreateLinqAllBlock([self objectEnumerator]);
}

- (LinqSelectBlock)selectMany
{
	return CreateLinqSelectManyBlock([self objectEnumerator]);
}

- (LinqBlock)first
{
	return CreateLinqFirstBlock([self objectEnumerator], ThrowsExceptionWhenSequenceIsEmpty);
}

- (LinqBlock)firstOrNil
{
	return CreateLinqFirstBlock([self objectEnumerator], 0);
}

@end
