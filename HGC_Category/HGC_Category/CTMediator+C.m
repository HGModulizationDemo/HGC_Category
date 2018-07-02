//
//  CTMediator+C.m
//  HGC_Category
//
//  Created by 胡志辉 on 2018/7/2.
//  Copyright © 2018年 胡志辉. All rights reserved.
//

#import "CTMediator+C.h"

@implementation CTMediator (C)

-(UIViewController *)C_viewController{
    return [self performTarget:@"C" action:@"viewController" params:nil shouldCacheTarget:NO];
}
    
@end
