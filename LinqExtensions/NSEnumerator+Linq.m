//
//  NSEnumerator+Linq.m
//  LinqExtensions
//
//  Created by Grayson Hansard on 4/29/14.
//  Copyright (c) 2014 From Concentrate Software. All rights reserved.
//

#import "NSEnumerator+Linq.h"

@implementation NSEnumerator (Linq)

- (LinqSelectBlock)select
{
	return CreateLinqSelectBlock(self);
}

- (LinqSelectBlock)selectMany
{
	return CreateLinqSelectManyBlock(self);
}

- (LinqWhereBlock)where
{
	return CreateLinqWhereBlock(self);
}

- (LinqAnyBlock)any
{
	return CreateLinqAnyBlock(self);
}

- (LinqAllBlock)all
{
	return CreateLinqAllBlock(self);
}

- (LinqBlock)first
{
	return CreateLinqFirstBlock(self, ThrowsExceptionWhenSequenceIsEmpty);
}

- (LinqBlock)firstOrNil
{
	return CreateLinqFirstBlock(self, 0);
}

- (LinqBlock)last
{
	return CreateLinqLastBlock(self, ThrowsExceptionWhenSequenceIsEmpty);
}

- (LinqBlock)lastOrNil
{
	return CreateLinqLastBlock(self, 0);
}

@end
