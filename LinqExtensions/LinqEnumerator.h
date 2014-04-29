//
//  LinqEnumerator.h
//  LinqExtensions
//
//  Created by Grayson Hansard on 4/29/14.
//  Copyright (c) 2014 From Concentrate Software. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef id(^LinqEnumeratorBlock)(id o);

@interface LinqEnumerator : NSEnumerator

+ (instancetype)enumeratorWithEnumerator:(NSEnumerator *)enumerator block:(LinqEnumeratorBlock)block;
- (id)initWithEnumerator:(NSEnumerator *)enumerator block:(LinqEnumeratorBlock)block;

@end
