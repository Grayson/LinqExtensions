#import "LinqEnumerator.h"
#import "LinqExceptions.h"
#import "LinqFunctions.h"
#import "LinqManyEnumerator.h"

LinqSelectBlock CreateLinqSelectBlock(NSEnumerator *enumerator)
{
	return [^(LinqBlock block) { return [LinqEnumerator enumeratorWithEnumerator:enumerator block:block]; } copy];
}

LinqSelectBlock CreateLinqSelectManyBlock(NSEnumerator *enumerator)
{
	return ^(LinqBlock block)
	{
		return [LinqManyEnumerator enumeratorWithEnumerator:CreateLinqSelectBlock(enumerator)(block)];
	};
}

LinqWhereBlock CreateLinqWhereBlock(NSEnumerator *enumerator)
{
	return [^(LinqBlock block) {
			return [LinqEnumerator enumeratorWithEnumerator:enumerator block:^(id o) {
					return !!block(o) ? o : nil;
				}];
		} copy];
}

LinqAnyBlock CreateLinqAnyBlock(NSEnumerator *enumerator)
{
	return [^(LinqBlockReturningBool block) {
			if (block == nil)
				return [enumerator nextObject] != nil;
			LinqWhereBlock whereBlock = CreateLinqWhereBlock(enumerator);
			NSEnumerator *anyEnumerator = whereBlock(block);
			return [anyEnumerator nextObject] != nil;
		} copy];
}

LinqAllBlock CreateLinqAllBlock(NSEnumerator *enumerator)
{
	return [^(LinqBlockReturningBool block) {
			assert(block != nil);
			for (id o in enumerator)
			{
				if (!block(o))
					return NO;
			}
			return YES;
		} copy];
}

LinqWhereBlock CreateLinqFirstBlock(NSEnumerator *enumerator, LinqBlockOptions options)
{
	return ^(LinqBlockReturningBool block) {
		id nextObject = block == nil ? [enumerator nextObject] : [CreateLinqWhereBlock(enumerator)(block) nextObject];
		if (nextObject == nil && ( (options & ThrowsExceptionWhenSequenceIsEmpty) == ThrowsExceptionWhenSequenceIsEmpty) )
			@throw [NSException exceptionWithName:InvalidOperationExceptionName reason:@"Sequence contains no elements" userInfo:nil];
		return nextObject;
	};
}