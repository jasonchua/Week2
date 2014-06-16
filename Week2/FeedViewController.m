//
//  FeedViewController.m
//  Week2
//
//  Created by Jason Chua on 6/14/14.
//  Copyright (c) 2014 Jason. All rights reserved.
//

#import "FeedViewController.h"
#import "LoginViewController.h"

@interface FeedViewController ()

@property (nonatomic) BOOL hasPresentedLogin;
@property (strong, nonatomic) IBOutlet UIScrollView *feedScroll;
@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;

@end

@implementation FeedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"News Feed";
    
    
    
    // Configure the left button
    UIImage *leftButtonImage = [[UIImage imageNamed:@"search-icon-sm.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:leftButtonImage style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    // Configure the right button
    UIImage *rightButtonImage = [[UIImage imageNamed:@"chat.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:rightButtonImage style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    LoginViewController *lvc = [[LoginViewController alloc] init];
    
    lvc.modalTransitionStyle = UIModalTransitionStyleCoverVertical; // Rises from below
    
    if (self.hasPresentedLogin) {
        return;
    }
    else [self presentViewController:lvc animated:NO completion:nil];
    self.hasPresentedLogin = YES;
   
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicatorView.center = self.view.center;
    [self.view addSubview:indicatorView];
    
    if (self.hasPresentedLogin) {
        [self.indicatorView startAnimating];
        [self.indicatorView performSelector:@selector(stopAnimating) withObject:nil afterDelay:2];
    }

    
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
