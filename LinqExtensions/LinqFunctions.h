#import "LinqEnumerator.h"

typedef id (^LinqBlock)(id o);
typedef int (^LinqBlockReturningBool)(id o);

typedef LinqEnumerator *(^LinqSelectBlock)(LinqBlock block);
typedef LinqEnumerator *(^LinqWhereBlock)(LinqBlockReturningBool block);
typedef BOOL (^LinqAnyBlock)(LinqBlockReturningBool block);
typedef BOOL (^LinqAllBlock)(LinqBlockReturningBool block);

LinqSelectBlock CreateLinqSelectBlock(NSEnumerator *enumerator);
LinqWhereBlock CreateLinqWhereBlock(NSEnumerator *enumerator);
LinqAnyBlock CreateLinqAnyBlock(NSEnumerator *enumerator);
LinqAllBlock CreateLinqAllBlock(NSEnumerator *enumerator);