//
//  FOCoursesTableViewController.m
//  Fore
//
//  Created by pavan krishna on 28/04/17.
//  Copyright © 2017 Dvlper. All rights reserved.
//

#import "FOCoursesTableViewController.h"
#import "FOCourseTableViewCell.h"

@interface FOCoursesTableViewController ()<UISearchBarDelegate,UIScrollViewDelegate>

@property(nonatomic, strong) UISearchBar *searchbar;

@end

@implementation FOCoursesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    
    [self createSearchBar];
}


-(void)createSearchBar;
{
    self.searchbar = [[UISearchBar alloc] init];
    self.searchbar.showsCancelButton = NO;
    self.searchbar.placeholder = @"Search...";
    self.searchbar.delegate = self;
    
    self.navigationItem.titleView = self.searchbar;
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

#pragma mark - Delegates

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar;
{
    [self.searchbar endEditing:YES];
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView;
{
    [self.searchbar endEditing:YES];
}

@end
