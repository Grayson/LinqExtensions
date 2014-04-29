//
//  main.m
//  LinqExtensions
//
//  Created by Grayson Hansard on 4/29/14.
//  Copyright (c) 2014 From Concentrate Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestObject.h"
#import "NSArray+Linq.h"

int main(int argc, const char * argv[])
{

	@autoreleasepool {
		TestObject *t1 = [TestObject new];
		TestObject *t2 = [TestObject new];
		TestObject *t3 = [TestObject new];
		
		t1.content = @(1);
		t2.content = @(2);
		t3.content = @(3);
		
	    NSArray *array = @[t1, t2, t3];
		NSEnumerator *enumerator = array.select(^(TestObject *o) { return o.content; });
		for (NSNumber *number in enumerator)
			NSLog(@"%@", number);
		
		NSLog(@"--");
		
		enumerator = array.where(^(TestObject *o) { return [o.content intValue] > 1; });
		for (NSNumber *number in enumerator)
			NSLog(@"%@", number);
		
		NSLog(@"--");
		enumerator = array.where(^(TestObject *o) { return [o.content intValue] > 100; });
		for (NSNumber *number in enumerator)
			NSLog(@"%@", number);
		
		NSLog(@"--");
		BOOL any = array.any(^(TestObject *o) { return [o.content intValue] == 1; });
		NSLog(@"%@matches", any ? @"" : @"no ");

		any = array.any(^(TestObject *o) { return [o.content intValue] == 100; });
		NSLog(@"%@matches", any ? @"" : @"no ");
		
		NSLog(@"--");
		BOOL all = array.all(^(TestObject *o) { return [o.content intValue] < 100; });
		NSLog(@"all: %u", all);
		
		all = array.all(^(TestObject *o) { return [o.content intValue] != 2; });
		NSLog(@"all: %u", all);
		
}
    return 0;
}

