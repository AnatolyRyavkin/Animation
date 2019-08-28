//
//  ViewController.m
//  lesson21-Animation
//
//  Created by Anatoly Ryavkin on 23/03/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()
@property (strong,nonatomic) UIView*testView;
@property (strong,nonatomic) UIView*testSecondView;
@end

@implementation ViewController
-(CGFloat)randomCGFloatAt256{
    return (CGFloat)(((arc4random()*1000)%256) /255.f);
}
-(UIColor*)randomColor{
    CGFloat r = [self randomCGFloatAt256];
    CGFloat g = [self randomCGFloatAt256];
    CGFloat b = [self randomCGFloatAt256];
    return [UIColor colorWithRed:r green:g blue:b alpha:0.8];
}
- (void)viewDidLoad {
    [super viewDidLoad];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    UIImageView*image=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"r.jpg"]];
    image.frame = CGRectMake(200, 500, 100, 100);
    [self.view addSubview:image];
    
  
    [UIView animateWithDuration:10
                          delay:0
                          options: UIViewAnimationOptionCurveLinear // | UIViewAnimationOptionBeginFromCurrentState
                          animations:^{
                                             image.center=CGPointMake(700, 550);
                                        }
                           completion:^(BOOL finished)  {
                                                                   NSLog(@"animation finished = %i",finished);
                                                            }
    ];
    
    double delayInSeconds = 3;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [image.layer removeAllAnimations];
    
        [UIView           animateWithDuration:10
                                        delay:0
                                        options: UIViewAnimationOptionBeginFromCurrentState
                                       animations:^{
                                                       // [image.layer removeAllAnimations];
                                                        image.center=CGPointMake(50, 50);
                                           
                                                     }
                                       completion:^(BOOL finished) {
                                                                             NSLog(@"animation finished = %i",finished);
                                                                       }
         ];
      });
}

@end

