//
//  LinqEnumerator.m
//  LinqExtensions
//
//  Created by Grayson Hansard on 4/29/14.
//  Copyright (c) 2014 From Concentrate Software. All rights reserved.
//

#import "LinqEnumerator.h"

@interface LinqEnumerator ()
@property (nonatomic, strong) NSEnumerator *enumerator;
@property (nonatomic, copy) LinqEnumeratorBlock block;
@end

@implementation LinqEnumerator

+ (instancetype)enumeratorWithEnumerator:(NSEnumerator *)enumerator block:(LinqEnumeratorBlock)block
{
	return [[[self class] alloc] initWithEnumerator:enumerator block:block];
}

- (id)initWithEnumerator:(NSEnumerator *)enumerator block:(LinqEnumeratorBlock)block
{
	NSParameterAssert(enumerator);
	NSParameterAssert(block);
	
	if ((self = [self init]) == nil)
		return nil;
	self.enumerator = enumerator;
	self.block = block;
	return self;
}

- (id)nextObject
{
	id nextObject = [self.enumerator nextObject];
	id evaluatedObject = self.block(nextObject);
	while (nextObject != nil && evaluatedObject == nil)
	{
		nextObject = [self.enumerator nextObject];
		evaluatedObject = self.block(nextObject);
	}
	return nextObject;
}

@end
