//
//  fivethView.m
//  Core Graphics
//
//  Created by zhang on 15/11/16.
//  Copyright © 2015年 zhangwei. All rights reserved.
//

#import "fivethView.h"

@implementation fivethView
-(id)init
{
    if (self = [super init]) {
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor whiteColor];
        
        
        [self.layer setNeedsDisplay];
        
    }
    return self;
}

-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    UIGraphicsBeginImageContextWithOptions(CYCLE_RECT.size, NO, 0);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CYCLE_RECT];
    [[UIColor grayColor]setFill];
    [path fill];
    UIImage *im = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
}




@end
