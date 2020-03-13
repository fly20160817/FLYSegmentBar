//
//  FLYViewController.m
//  FLYSegmentBar
//
//  Created by fly20160817 on 03/11/2020.
//  Copyright (c) 2020 fly20160817. All rights reserved.
//

#import "FLYViewController.h"
#import "FLYSegmentBar.h"

@interface FLYViewController () < FLYSegmentBarDelegate >

@property (nonatomic, strong) FLYSegmentBar * segmentBar;

@end

@implementation FLYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    self.navigationItem.titleView = self.segmentBar;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - FLYSegmentBarDelegate

-(void)segmentBar:(FLYSegmentBar *)segmentBar didSelectIndex:(NSInteger)toIndex fromIndex:(NSInteger)fromIndex
{
    NSLog(@"%ld -> %ld", (long)fromIndex, (long)toIndex);
}



#pragma mark - setters and getters

-(FLYSegmentBar *)segmentBar
{
    if ( _segmentBar == nil )
    {
        NSArray * titleArray = @[@"情非得已", @"伯通", @"欧阳修克", @"烤山芋", @"南京", @"上山打老虎哈", @"周七"];
        
        _segmentBar = [[FLYSegmentBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 35) titleNames:titleArray];
        //_segmentBar.splitEqually = YES;
        _segmentBar.delegate = self;
        
        
        FLYSegmentBarConfig *config = [FLYSegmentBarConfig defaultConfig];
        /*******普通方式赋值******/
        /*
        config.segmentBarBackColor = [UIColor yellowColor];
        config.itemNormalColor = [UIColor blackColor];
        config.itemSelectColor = [UIColor redColor];
        config.itemFont = [UIFont systemFontOfSize:16];
        config.indicatorColor = [UIColor blueColor];
        config.indicatorHeight = 2;
        config.indicatorWidth = FLYSegmentBarIndicatorAutomaticWidth;
        _segmentBar.config = config;
         */
        
        
        //链式赋值
        config.backColor([UIColor yellowColor]).itemNColor([UIColor blackColor]).itemSColor([UIColor redColor]).itemF([UIFont systemFontOfSize:16]).indColor([UIColor blueColor]).indHeight(2).indWidth(FLYSegmentBarIndicatorAutomaticWidth);
        _segmentBar.config = config;

    }
    return _segmentBar;
}

@end
