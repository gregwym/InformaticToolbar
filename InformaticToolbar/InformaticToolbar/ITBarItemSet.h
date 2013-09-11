//
//  ITBarItemSet.h
//  InformaticToolbar
//
//  Created by Greg Wang on 12-10-13.
//  Copyright (c) 2012年 Greg Wang. All rights reserved.
//

#ifndef SYSTEM_VERSION_LESS_THAN
#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#endif

@interface ITBarItemSet : NSObject

@property (nonatomic, strong, readonly) NSArray *barItems;
@property (nonatomic, weak) id dismissTarget;
@property (nonatomic) SEL dismissAction;

- (ITBarItemSet *)initWithItems:(NSArray *)barItems;
- (IBAction)dismiss:(id)sender;

@end
