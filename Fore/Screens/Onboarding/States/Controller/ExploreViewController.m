//
//  ExploreViewController.m
//  Fore
//
//  Created by pavan krishna on 27/04/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "ExploreViewController.h"
#import "FOStateCollectionViewCell.h"
#import "FOCourseCollectionViewCell.h"
#import "ExploreView.h"

@interface ExploreViewController ()<UISearchBarDelegate,UIScrollViewDelegate,ExploreViewDataSource,ExploreViewDelegate>

@property (nonatomic, strong) LayoutManager *layoutManager;

@property(nonatomic, strong) UIButton *profileIconBtn;
@property(nonatomic, strong) UISearchBar *searchbar;
@property(nonatomic, strong) NSMutableArray *statesArray;
@property(nonatomic, strong) ExploreView *exploreView;

@end

@implementation ExploreViewController

-(void)loadView
{
    [super loadView];
    self.layoutManager = [[LayoutManager alloc] init];
    self.exploreView = [[ExploreView alloc] init];
    self.exploreView.dataSource = self;
    self.exploreView.delegate = self;
    self.view = self.exploreView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    
    [self createSearchBar];
    
    UIView *rightBarButtonItems = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 76, 32)];
    [rightBarButtonItems addSubview:self.profileIconBtn];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBarButtonItems];
}

-(void)createSearchBar;
{
    self.searchbar = [[UISearchBar alloc] init];
    self.searchbar.showsCancelButton = NO;
    self.searchbar.placeholder = @"Search...";
    self.searchbar.delegate = self;
    
    self.navigationItem.titleView = self.searchbar;
    
    self.profileIconBtn =  [UIButton buttonWithType:UIButtonTypeCustom];
    [self.profileIconBtn setImage:[UIImage imageNamed:@"profile_icon"] forState:UIControlStateNormal];
    [self.profileIconBtn addTarget:self action:@selector(profileIconButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.profileIconBtn setFrame:CGRectMake(44, 0, 32, 32)];
}

-(void)viewWillAppear:(BOOL)animated;
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Actions

-(void)profileIconButtonPressed;
{
    [self performSegueWithIdentifier:@"gotoProfileScreen" sender:nil];
}

#pragma mark - Delegates

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar;
{
    [self.searchbar endEditing:YES];
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView;
{
    [self.searchbar endEditing:YES];
}

-(void)gotoCoursesScreen:(NSInteger)userID;
{
    [self performSegueWithIdentifier:@"gotoCoursesScreen" sender:nil];
}

@end
