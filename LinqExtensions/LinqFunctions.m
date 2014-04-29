#import "LinqFunctions.h"

LinqSelectBlock CreateLinqSelectBlock(NSEnumerator *enumerator)
{
	return [^(LinqBlock block) { return [LinqEnumerator enumeratorWithEnumerator:enumerator block:block]; } copy];
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
			LinqEnumerator *anyEnumerator = whereBlock(block);
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