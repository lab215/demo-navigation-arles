//
//  AppDelegate.m
//  arles2012
//
//  Created by Franco Bouly on 1/7/12.
//  Copyright (c) 2012 Gobelins. All rights reserved.
//

//Json de mise à jour
#define kBgQueue_maj dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#define kLatestKivaLoansURL_maj [NSURL URLWithString:@"http://cdnl2012.gobelins.fr/arles/g3/content/json/maj.json"]

//Json contenu
#define kBgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0) 
#define kLatestKivaLoansURL [NSURL URLWithString:@"http://cdnl2012.gobelins.fr/arles/g3/content/json/arles.json"] 

#import "AppDelegate.h"

#import "HomeViewController.h"
#import "IIViewDeckController.h"
#import "LeftViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize centerController = _viewController;
@synthesize leftController = _leftController;
@synthesize imageController = _imageController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.leftController = [[LeftViewController alloc] initWithNibName:@"LeftViewController" bundle:nil];
    
    HomeViewController *centerController = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    self.centerController = [[UINavigationController alloc] initWithRootViewController:centerController];
    
    IIViewDeckController* deckController =  [[IIViewDeckController alloc] initWithCenterViewController:self.centerController 
                                                                                    leftViewController:self.leftController
                                                                                   rightViewController:nil];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
    }
    else {
        
    }
    
    self.window.rootViewController = deckController;
    [self.window makeKeyAndVisible];
    
    [application setStatusBarStyle:UIStatusBarStyleBlackOpaque];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"MENU_BACKGROUND.png"] forBarMetrics:UIBarMetricsDefault];
    
    //Chargement du de recherche de mise a jour
    
        NSData* data = [NSData dataWithContentsOfURL:
                        kLatestKivaLoansURL_maj];
        [self performSelectorOnMainThread:@selector(jsonLoading:)
                               withObject:data waitUntilDone:YES];
   
    
    
    return YES;
}

//verifie si il y a eu une mise a jour
-(void) jsonLoading:(NSData *)responseData{
    NSError* error;
    
    NSDictionary *json= [NSJSONSerialization
                         JSONObjectWithData:responseData //1
                         options:kNilOptions
                         error:&error];
    NSString *maj= [json objectForKey:@"last"];
   
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString * last_maj= [userDefaults objectForKey:@"maj"];
  
    //Si il y a eu une mise a jour, chargement du nouveau json
    if (last_maj ==nil || ![last_maj isEqualToString:maj ]) {
   
        
            NSData* data = [NSData dataWithContentsOfURL:
                            kLatestKivaLoansURL];
            [self performSelectorOnMainThread:@selector(fetchedData:)
                                   withObject:data waitUntilDone:YES];
        
        
        [userDefaults setObject:maj forKey:@"maj"];
        [userDefaults synchronize];
        
    }

}

//Chargement du json
- (void)fetchedData:(NSData *)responseData {
    //parse out the json data
    NSError* error;

   NSMutableDictionary *json= [NSJSONSerialization
            JSONObjectWithData:responseData //1
            options:kNilOptions
            error:&error];

   
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
     //Enregistrement du json dans le cache
    [userDefaults setObject:json forKey:@"json"];
    
    //Reorganisation expos par ordre alphabetique
    NSSortDescriptor *sd = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES];
    NSArray *sds = [NSArray arrayWithObject:sd];
    NSArray *Expos = [[[userDefaults objectForKey:@"json"] objectForKey:@"expos"] sortedArrayUsingDescriptors:sds];
    [userDefaults setObject:Expos forKey:@"expos"];
    
    //Reorganisation artistes par ordre alphabetique
    NSSortDescriptor *sda = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES];
    NSArray *sdas = [NSArray arrayWithObject:sda];
    NSArray *Artistes = [[[userDefaults objectForKey:@"json"] objectForKey:@"artistes"] sortedArrayUsingDescriptors:sdas];
    [userDefaults setObject:Artistes forKey:@"artistes"];
    
    //Reorganisation lieux par ordre alphabetique
    NSSortDescriptor *sdl = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES];
    NSArray *sdls = [NSArray arrayWithObject:sdl];
    NSArray *Lieux = [[[userDefaults objectForKey:@"json"] objectForKey:@"lieux"] sortedArrayUsingDescriptors:sdls];
    [userDefaults setObject:Lieux forKey:@"lieux"];
    
    //Reorganisation events par ordre alphabetique
    NSSortDescriptor *sdDate = [NSSortDescriptor sortDescriptorWithKey:@"date_start" ascending:YES];
    sds = [NSArray arrayWithObject:sdDate];
    NSArray *Events = [[[userDefaults objectForKey:@"json"] objectForKey:@"events"] sortedArrayUsingDescriptors:sds];
    [userDefaults setObject:Events forKey:@"events"];
    
    //sauvegarde du cache
    
    [userDefaults synchronize];
    NSLog(@"MAJ JSON");
    NSLog(@"MAJ JSON %@", Events);
  
   
    
}

- (void)customizeAppearance
{
    // UIBarButtonItem - Back
    
    UIImage *buttonBack30 = [[UIImage imageNamed:@"menu-prev"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 13, 0, 5)];

    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:buttonBack30 forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
 
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}


@end
