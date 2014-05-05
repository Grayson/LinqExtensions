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

@end
