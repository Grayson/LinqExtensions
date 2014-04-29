//
//  NSArray+Linq.h
//  LinqExtensions
//
//  Created by Grayson Hansard on 4/29/14.
//  Copyright (c) 2014 From Concentrate Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinqFunctions.h"

@interface NSArray (Linq)

- (LinqSelectBlock)select;
- (LinqWhereBlock)where;
- (LinqAnyBlock)any;
- (LinqAllBlock)all;

@end
