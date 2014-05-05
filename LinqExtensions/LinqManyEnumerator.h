//
//  LinqManyEnumerator.h
//  LinqExtensions
//
//  Created by Grayson Hansard on 5/4/14.
//  Copyright (c) 2014 From Concentrate Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LinqManyEnumerator : NSEnumerator

+ (instancetype)enumeratorWithEnumerator:(NSEnumerator *)enumerator;
- (id)initWithEnumerator:(NSEnumerator *)enumerator;

@end
