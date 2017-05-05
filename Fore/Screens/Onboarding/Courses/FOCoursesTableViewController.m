//
//  FOCoursesTableViewController.m
//  Fore
//
//  Created by pavan krishna on 28/04/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "FOCoursesTableViewController.h"
#import "FOCourseTableViewCell.h"
#import "LayoutManager.h"
#import "SSSearchBar.h"

@interface FOCoursesTableViewController ()<SSSearchBarDelegate,UIScrollViewDelegate>
{
    UIBarButtonItem *backButtonItem;
    UIBarButtonItem *negativeSpacer;
}
@property (nonatomic, strong) LayoutManager *layoutManager;
@property (nonatomic, strong) SSSearchBar *searchbar;
@property (nonatomic, strong) UIButton *filterIconBtn;
@property (nonatomic, strong) UIButton *backIconBtn;

@end

@implementation FOCoursesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.layoutManager = [[LayoutManager alloc] init];

    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    
    [self createSearchBar];
    
    self.filterIconBtn =  [UIButton buttonWithType:UIButtonTypeCustom];
    [self.filterIconBtn setImage:[UIImage imageNamed:@"filter_image"] forState:UIControlStateNormal];
    [self.filterIconBtn addTarget:self action:@selector(filterIconButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.filterIconBtn setFrame:CGRectMake(44, 0, 32, 32)];

    UIView *rightBarButtonItems = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 76, 32)];
    [rightBarButtonItems addSubview:self.filterIconBtn];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBarButtonItems];
}

-(void)createSearchBar;
{
    self.searchbar = [[SSSearchBar alloc] initWithFrame:CGRectMake(0, 0, [[self layoutManager] width:100], 32)];
    self.searchbar.cancelButtonHidden = YES;
    self.searchbar.placeholder = @"Search...";
    self.searchbar.delegate = self;
    
    self.navigationItem.titleView = self.searchbar;
    
    self.navigationItem.backBarButtonItem=nil;
    self.navigationItem.hidesBackButton=YES;
    
    UIButton *backButton = [[UIButton alloc] initWithFrame: CGRectMake(10, 0, 40, 21)];
//    backButton.layer.borderColor = [UIColor redColor].CGColor;
//    backButton.layer.borderWidth = 1;
    UIImage *backImage = [UIImage imageNamed:@"Back_50"];
    [backButton setImage:backImage  forState:UIControlStateNormal];
//    [backButton setTitleEdgeInsets:UIEdgeInsetsMake(10.0, 30.0, 10.0, 30.0)];
    [backButton setTitle:@"" forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    backButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    [negativeSpacer setWidth:-15];
    
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer,backButtonItem,nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FOCourseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"courseCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    [self configureCellTitle:cell withIndexPath:indexPath];
    
    return cell;
}

-(UITableViewCell *)configureCellTitle:(UITableViewCell *)cell withIndexPath:(NSIndexPath *)indexPath;
{
    FOCourseTableViewCell *courseTableViewCell = (FOCourseTableViewCell *)cell;
    [courseTableViewCell setCourseImage:@"course_dummy_image"];
    [courseTableViewCell setCourseName:@"Florida Golf"];
    [courseTableViewCell setTownName:@"Florida"];
    [courseTableViewCell setParText:@"Par 4"];
    [courseTableViewCell setSlopeText:@"Slope 3"];
    
    return courseTableViewCell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return [[self layoutManager] height:40];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
//    [[self tableView] deselectRowAtIndexPath:indexPath animated:NO];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Actions

-(void)filterIconButtonPressed;
{
    [self performSegueWithIdentifier:@"gotoFilterScreen" sender:nil];
}

- (void)backButtonPressed;
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - SSSearchbar Delegate

-(void)searchBarSearchButtonClicked:(SSSearchBar *)searchBar;
{
    [self.searchbar endEditing:YES];
    searchBar.placeholder = @"Search...";
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView;
{
    [self.searchbar endEditing:YES];
}

- (void)searchBarTextDidBeginEditing:(SSSearchBar *)searchBar
{
    self.navigationItem.leftBarButtonItems = nil;
}

- (void)searchBarTextDidEndEditing:(SSSearchBar *)searchBar
{
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer,backButtonItem,nil];
    searchBar.placeholder = @"Search...";
}

- (void)searchBarCancelButtonClicked:(SSSearchBar *)searchBar
{
    searchBar.placeholder = @"Search...";
    [searchBar resignFirstResponder];
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer,backButtonItem,nil];
}


@end
