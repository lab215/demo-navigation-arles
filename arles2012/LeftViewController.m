//
//  LeftViewController.m
//  ViewDeckExample
//


#import "LeftViewController.h"
#import "IIViewDeckController.h"
#import "RootViewController.h"
#import "CustomMenuCell.h"

// Import des Controllers de menu
#import "ArtistesViewController.h"
#import "AgendaPagedViewController.h"
#import "LieuxViewController.h"
#import "ExposViewController.h"
#import "BilletViewController.h"
#import "InfosViewController.h"
#import "FavoritesViewController.h"
#import "GeolocViewController.h"

//  A VIRER !!!!!
#import "HomeViewController.h"
#import "TestController.h"




@implementation LeftViewController

@synthesize tableView = _tableView;
@synthesize headTitle = _headTitle;
@synthesize menuControllers = _menuControllers;

- (id)init
{
    self = [super init];
    if (self) {
        [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"detail_background.png"]]];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    NSArray *rencontres = [[NSArray alloc] initWithObjects:
                           [[ArtistesViewController alloc] init],
                           [[LieuxViewController alloc] init],
                           [[ExposViewController alloc] init], nil];
    NSArray *informations = [[NSArray alloc] initWithObjects:
                             [[BilletViewController alloc] init],                             
                             [[AgendaPagedViewController alloc] init],
                             [[InfosViewController alloc] init], nil];
    NSArray *petitsplus = [[NSArray alloc] initWithObjects:                           
                           [[FavoritesViewController alloc] init],
                           [[HomeViewController alloc] init], nil];
    
    self.menuControllers = [[NSArray alloc] initWithObjects:
                            rencontres,
                            informations,
                            petitsplus,
                            nil];
    
    [self.headTitle setFont:[UIFont fontWithName:@"arlesienne2011" size:24]];
    self.headTitle.text = [self.headTitle.text uppercaseString];
}   

- (void)viewDidUnload
{
    [self setTableView:nil];
    [self setHeadTitle:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return NO;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.menuControllers.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.menuControllers objectAtIndex:section] count];
}

- (void)configureCell:(CustomMenuCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath 
{
    RootViewController *controller = [[self.menuControllers objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    cell.title.text = controller.menuTitle ? [controller.menuTitle uppercaseString] : @"NO TITLE";
    cell.subTitle.text = controller.menuSubTitle ? [controller.menuSubTitle uppercaseString] : @"NO SUBTITLE";
    cell.icon.image = controller.menuLogo; // @todo: Ajouter un image par defaut
    [cell setHover: controller.menuLogoOn];
    
  
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"customMenuCell";
    
    CustomMenuCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[CustomMenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [self configureCell:(CustomMenuCell *)cell forRowAtIndexPath:indexPath];
    
    return cell;
}

- (UIView *)tableView: (UITableView *)tableView viewForHeaderInSection:(NSInteger)section 
{
    UIImageView *view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"customMenuHeader-BG.png"]];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(25, 4, 250, 11)];
    
    switch (section) {
        case 0:
            label.text = @"LES RENCONTRES";
            break;
        case 1:
            label.text = @"INFORMATIONS";
            break;
        case 2:
            label.text = @"LES PETITS PLUS";
            break;
        default:
            break;
    }
    
    label.font = [UIFont fontWithName:@"Helvetica-Bold" size:12];
    label.textColor = [UIColor lightGrayColor];
    label.backgroundColor = [UIColor clearColor];
    [view addSubview:label];
    
    return view;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    RootViewController *rootViewController = [[self.menuControllers objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
    if (rootViewController.menuTitle == @"Favoris") {
        
        // @Damien: Faire le test ici
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        
        if ([[userDefaults objectForKey:@"favoritesExpos"] count] == 0 &&
            [[userDefaults objectForKey:@"favoritesArtistes"] count] == 0 &&
            [[userDefaults objectForKey:@"favoritesLieux"] count] == 0 &&
            [[userDefaults objectForKey:@"favoritesEvenements"] count] == 0) {
            // Si aucun favoris enregistré
            UIAlertView *alertBox = [[UIAlertView alloc] initWithTitle:nil message:@"Aucun favoris" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertBox show];
            return;
        }
    }      
    [self.viewDeckController closeLeftViewBouncing:^(IIViewDeckController *controller)
     {
         navController.navigationBarHidden = YES;
         self.viewDeckController.centerController = navController;
         navController.navigationBarHidden = NO;
     }];
}

@end
