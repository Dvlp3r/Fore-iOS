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
//    self.statesArray = [NSMutableArray array];
//    _statesArray = [NSMutableArray array];
//    NSMutableDictionary *dict1 = [NSMutableDictionary dictionary];
//    [dict1 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
//    [dict1 setObject:@"Florida" forKey:@"name"];
//    [_statesArray addObject:dict1];
//    
//    NSMutableDictionary *dict2 = [NSMutableDictionary dictionary];
//    [dict2 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
//    [dict2 setObject:@"Georgia" forKey:@"name"];
//    [_statesArray addObject:dict2];
//    
//    NSMutableDictionary *dict3 = [NSMutableDictionary dictionary];
//    [dict3 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
//    [dict3 setObject:@"Ohio" forKey:@"name"];
//    [_statesArray addObject:dict3];
//    
//    NSMutableDictionary *dict4 = [NSMutableDictionary dictionary];
//    [dict4 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
//    [dict4 setObject:@"New York" forKey:@"name"];
//    [_statesArray addObject:dict4];
//    
//    NSMutableDictionary *dict5 = [NSMutableDictionary dictionary];
//    [dict5 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
//    [dict5 setObject:@"Illinois" forKey:@"name"];
//    [_statesArray addObject:dict5];
//    
//    NSMutableDictionary *dict6 = [NSMutableDictionary dictionary];
//    [dict6 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
//    [dict6 setObject:@"New Jersey" forKey:@"name"];
//    [_statesArray addObject:dict6];
//
//    NSMutableDictionary *dict7= [NSMutableDictionary dictionary];
//    [dict7 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
//    [dict7 setObject:@"Florida" forKey:@"name"];
//    [_statesArray addObject:dict7];
//    
//    NSMutableDictionary *dict8 = [NSMutableDictionary dictionary];
//    [dict8 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
//    [dict8 setObject:@"Georgia" forKey:@"name"];
//    [_statesArray addObject:dict8];
//    
//    NSMutableDictionary *dict9 = [NSMutableDictionary dictionary];
//    [dict9 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
//    [dict9 setObject:@"Ohio" forKey:@"name"];
//    [_statesArray addObject:dict9];
//    
//    NSMutableDictionary *dict10 = [NSMutableDictionary dictionary];
//    [dict10 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
//    [dict10 setObject:@"New York" forKey:@"name"];
//    [_statesArray addObject:dict10];
//    
//    NSMutableDictionary *dict11 = [NSMutableDictionary dictionary];
//    [dict11 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
//    [dict11 setObject:@"Illinois" forKey:@"name"];
//    [_statesArray addObject:dict11];
//    
//    NSMutableDictionary *dict12 = [NSMutableDictionary dictionary];
//    [dict12 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
//    [dict12 setObject:@"New Jersey" forKey:@"name"];
//    [_statesArray addObject:dict12];
//
//    NSMutableDictionary *dict13 = [NSMutableDictionary dictionary];
//    [dict13 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
//    [dict13 setObject:@"Florida" forKey:@"name"];
//    [_statesArray addObject:dict13];
//    
//    NSMutableDictionary *dict14 = [NSMutableDictionary dictionary];
//    [dict14 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
//    [dict14 setObject:@"Georgia" forKey:@"name"];
//    [_statesArray addObject:dict14];
//    
//    NSMutableDictionary *dict15 = [NSMutableDictionary dictionary];
//    [dict15 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
//    [dict15 setObject:@"Ohio" forKey:@"name"];
//    [_statesArray addObject:dict15];
//    
//    NSMutableDictionary *dict16 = [NSMutableDictionary dictionary];
//    [dict16 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
//    [dict16 setObject:@"New York" forKey:@"name"];
//    [_statesArray addObject:dict16];
//    
//    NSMutableDictionary *dict17 = [NSMutableDictionary dictionary];
//    [dict17 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
//    [dict17 setObject:@"Illinois" forKey:@"name"];
//    [_statesArray addObject:dict17];
//    
//    NSMutableDictionary *dict18 = [NSMutableDictionary dictionary];
//    [dict18 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
//    [dict18 setObject:@"New Jersey" forKey:@"name"];
//    [_statesArray addObject:dict18];
//
//    NSMutableDictionary *dict19 = [NSMutableDictionary dictionary];
//    [dict19 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
//    [dict19 setObject:@"Florida" forKey:@"name"];
//    [_statesArray addObject:dict19];
//    
//    NSMutableDictionary *dict20 = [NSMutableDictionary dictionary];
//    [dict20 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
//    [dict20 setObject:@"Georgia" forKey:@"name"];
//    [_statesArray addObject:dict20];
//    
//    NSMutableDictionary *dict21 = [NSMutableDictionary dictionary];
//    [dict21 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
//    [dict21 setObject:@"Ohio" forKey:@"name"];
//    [_statesArray addObject:dict21];
//    
//    NSMutableDictionary *dict22 = [NSMutableDictionary dictionary];
//    [dict22 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
//    [dict22 setObject:@"New York" forKey:@"name"];
//    [_statesArray addObject:dict22];
//    
//    NSMutableDictionary *dict23 = [NSMutableDictionary dictionary];
//    [dict23 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
//    [dict23 setObject:@"Illinois" forKey:@"name"];
//    [_statesArray addObject:dict23];
//    
//    NSMutableDictionary *dict24 = [NSMutableDictionary dictionary];
//    [dict24 setObject:@"state_dummy_image.png" forKey:@"cellImage"];
//    [dict24 setObject:@"New Jersey" forKey:@"name"];
//    [_statesArray addObject:dict24];

    self.exploreView = [[ExploreView alloc] init];
    self.exploreView.dataSource = self;
    self.exploreView.delegate = self;
//    self.exploreView.statesArray = self.statesArray;
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
