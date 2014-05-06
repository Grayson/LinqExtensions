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

- (LinqBlock)last
{
	return CreateLinqLastBlock([self objectEnumerator], ThrowsExceptionWhenSequenceIsEmpty);
}

- (LinqBlock)lastOrNil
{
	return CreateLinqLastBlock([self objectEnumerator], 0);
}

- (LinqSkipBlock)skip
{
	return CreateLinqSkipBlock([self objectEnumerator]);
}

- (LinqWhereBlock)skipWhile
{
	return CreateLinqSkipWhileBlock([self objectEnumerator]);
}

@end
