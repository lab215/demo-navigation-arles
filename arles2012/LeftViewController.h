//
//  LeftViewController.h
//  ViewDeckExample
//


#import <UIKit/UIKit.h>

@interface LeftViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *headTitle;

@property (strong, nonatomic) NSArray *menuControllers;

@end
