//
//  FLYtestViewController.m
//  FLYSegmentBar_Example
//
//  Created by fly on 2020/3/13.
//  Copyright © 2020 fly20160817. All rights reserved.
//

#import "FLYtestViewController.h"

@interface FLYtestViewController ()

@property (nonatomic, strong) NSMutableArray * array;

@end

@implementation FLYtestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
    
    self.array = [NSMutableArray array];
    for (int i = 0; i < 10000000; i++ )
    {
        NSString * string = @"fly";
        [self.array addObject:string];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
