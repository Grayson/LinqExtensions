//
//  LinqManyEnumerator.m
//  LinqExtensions
//
//  Created by Grayson Hansard on 5/4/14.
//  Copyright (c) 2014 From Concentrate Software. All rights reserved.
//

#import "LinqManyEnumerator.h"

@implementation LinqManyEnumerator
{
	NSEnumerator *_enumerator;
	NSEnumerator *_currentEnumerator;
}

+ (instancetype)enumeratorWithEnumerator:(NSEnumerator *)enumerator
{
	return [[[self class] alloc] initWithEnumerator:enumerator];
}

- (id)initWithEnumerator:(NSEnumerator *)enumerator
{
	if ((self = [self init]) == nil)
		return nil;
	_enumerator = enumerator;
	return self;
}

- (id)nextObject
{
	id nextObject = [_currentEnumerator nextObject];
	if (nextObject == nil)
	{
		id nextCollection = [_enumerator nextObject];
		if (nextCollection != nil)
		{
			_currentEnumerator = [nextCollection isKindOfClass:[NSEnumerator class]] ? nextCollection : [nextCollection respondsToSelector:@selector(objectEnumerator)] ? [nextCollection objectEnumerator] : nil;
			nextObject = [_currentEnumerator nextObject];
		}
	}
	return nextObject;
}

@end
