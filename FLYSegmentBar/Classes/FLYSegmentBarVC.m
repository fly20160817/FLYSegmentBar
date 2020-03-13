//
//  FLYSegmentBarVC.m
//  FLYSegmentBar
//
//  Created by fly on 2020/3/13.
//

#import "FLYSegmentBarVC.h"
#import "FLYSegmentBar.h"
#import "UIView+FLYSegmentBar.h"

@interface FLYSegmentBarVC () < UIScrollViewDelegate, FLYSegmentBarDelegate >

@property (nonatomic, strong) FLYSegmentBar * segmentBar;
@property (nonatomic, strong) UIScrollView * scrollView;

@end

@implementation FLYSegmentBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initUI];
}

-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    self.scrollView.frame = self.view.bounds;
}



#pragma mark - UI

- (void)initUI
{
    self.navigationItem.titleView = self.segmentBar;
    
    [self.view addSubview:self.scrollView];
    
    [self setupChildViewControllers];
}

- (void)setupChildViewControllers
{
    NSArray * vcNames = @[@"FLYtestViewController", @"FLYtestViewController", @"FLYtestViewController", @"FLYtestViewController"];
    
    for ( int i = 0; i < vcNames.count; i++ )
    {
        NSString * vcName = vcNames[i];
        UIViewController * vc = [[NSClassFromString(vcName) alloc] init];
        [self addChildViewController:vc];
    }
    
    self.scrollView.contentSize = CGSizeMake(self.view.width * vcNames.count, 0);
    
    
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
    NSInteger idx = scrollView.contentOffset.x / scrollView.width;
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
    vc.view.frame = CGRectMake(index * self.scrollView.width, 0, self.scrollView.width, self.scrollView.height);
    [self.scrollView addSubview:vc.view];
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.width * index, 0) animated:YES];
}



#pragma mark - setters and getters

-(UIScrollView *)scrollView
{
    if ( _scrollView == nil )
    {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.delegate = self;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = NO;
    }
    return _scrollView;
}

-(FLYSegmentBar *)segmentBar
{
    if ( _segmentBar == nil )
    {
        NSArray * nameArray = @[@"清单", @"详情", @"档案", @"支持"];
        _segmentBar = [[FLYSegmentBar alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 35) titleNames:nameArray];
        _segmentBar.delegate = self;
        _segmentBar.splitEqually = YES;
    }
    return _segmentBar;
}



@end
