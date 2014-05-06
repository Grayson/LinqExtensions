typedef id (^LinqBlock)(id o);
typedef int (^LinqBlockReturningBool)(id o);

typedef NSEnumerator *(^LinqSelectBlock)(LinqBlock block);
typedef NSEnumerator *(^LinqWhereBlock)(LinqBlockReturningBool block);
typedef BOOL (^LinqAnyBlock)(LinqBlockReturningBool block);
typedef BOOL (^LinqAllBlock)(LinqBlockReturningBool block);

typedef NS_OPTIONS(NSUInteger, LinqBlockOptions) {
	ThrowsExceptionWhenSequenceIsEmpty = 0x01,
};

LinqSelectBlock CreateLinqSelectBlock(NSEnumerator *enumerator);
LinqSelectBlock CreateLinqSelectManyBlock(NSEnumerator *enumerator);
LinqWhereBlock CreateLinqWhereBlock(NSEnumerator *enumerator);
LinqAnyBlock CreateLinqAnyBlock(NSEnumerator *enumerator);
LinqAllBlock CreateLinqAllBlock(NSEnumerator *enumerator);
LinqWhereBlock CreateLinqFirstBlock(NSEnumerator *enumerator, LinqBlockOptions options);
LinqWhereBlock CreateLinqLastBlock(NSEnumerator *enumerator, LinqBlockOptions options);