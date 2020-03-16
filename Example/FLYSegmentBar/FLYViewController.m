//
//  FLYViewController.m
//  FLYSegmentBar
//
//  Created by fly20160817 on 03/11/2020.
//  Copyright (c) 2020 fly20160817. All rights reserved.
//

#import "FLYViewController.h"
#import "FLYSegmentBar.h"

@interface FLYViewController () < UIScrollViewDelegate, FLYSegmentBarDelegate >

@property (nonatomic, strong) FLYSegmentBar * segmentBar;
@property (nonatomic, strong) UIScrollView * scrollView;

@end

@implementation FLYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self initUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - UI

- (void)initUI
{
    self.navigationItem.titleView = self.segmentBar;
    [self.view addSubview:self.scrollView];
       
       
    
    UIViewController * vc1 = [[UIViewController alloc] init];
    vc1.view.backgroundColor = [UIColor purpleColor];
    UIViewController * vc2 = [[UIViewController alloc] init];
    vc2.view.backgroundColor = [UIColor orangeColor];
    UIViewController * vc3 = [[UIViewController alloc] init];
    vc3.view.backgroundColor = [UIColor cyanColor];
    UIViewController * vc4 = [[UIViewController alloc] init];
    vc4.view.backgroundColor = [UIColor redColor];
    NSArray * array = @[vc1, vc2, vc3, vc4];
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * array.count, 0);
    for ( UIViewController *vc in array )
    {
        [self addChildViewController:vc];
    }
    
    
    //展示第一个页面
    self.segmentBar.selectIndex = 0;
}



#pragma mark - FLYSegmentBarDelegate

-(void)segmentBar:(FLYSegmentBar *)segmentBar didSelectIndex:(NSInteger)toIndex fromIndex:(NSInteger)fromIndex
{
    [self showChildVCViewsAtIndex:toIndex];
}



#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger idx = scrollView.contentOffset.x / scrollView.frame.size.width;
    self.segmentBar.selectIndex = idx;
}



#pragma mark - private methods

- (void)showChildVCViewsAtIndex: (NSInteger)index
{
    // 数据过滤
    if ( index < 0 || index >= self.childViewControllers.count )
    {
        return;
    }
    
    UIViewController * vc = self.childViewControllers[index];
    vc.view.frame = CGRectMake(index * self.scrollView.frame.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
    [self.scrollView addSubview:vc.view];
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.frame.size.width * index, 0) animated:YES];
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

-(UIScrollView *)scrollView
{
    if ( _scrollView == nil )
    {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        _scrollView.delegate = self;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = NO;
    }
    return _scrollView;
}

@end
