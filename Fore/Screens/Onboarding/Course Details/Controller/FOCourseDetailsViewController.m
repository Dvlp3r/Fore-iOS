//
//  FOCourseDetailsViewController.m
//  Fore
//
//  Created by pavan krishna on 28/04/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "FOCourseDetailsViewController.h"
#import "FOCourseDetailsView.h"
#import "LayoutManager.h"

@interface FOCourseDetailsViewController ()<FOCourseDetailsViewDataSource,FOCourseDetailsViewDelegate>

@property (nonatomic, strong) LayoutManager *layoutManager;

@property(nonatomic, strong) UIButton *starButton;
@property(nonatomic, strong) UIButton *shareButton;
@property(nonatomic, strong) UISearchBar *searchbar;
@property(nonatomic, strong) NSMutableArray *statesArray;
@property(nonatomic, strong) FOCourseDetailsView *courseDetailsView;

@end

@implementation FOCourseDetailsViewController

-(void)loadView
{
    [super loadView];
    self.layoutManager = [[LayoutManager alloc] init];
    self.courseDetailsView = [[FOCourseDetailsView alloc] init];
    self.courseDetailsView.dataSource = self;
    self.courseDetailsView.delegate = self;
    self.view = self.courseDetailsView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self.navigationController setNavigationBarHidden:NO animated:NO];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    
    UIView *rightBarButtonItems = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 76, 32)];
    [rightBarButtonItems addSubview:self.starButton];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBarButtonItems];
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

@end
