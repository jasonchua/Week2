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
@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;
@property (weak, nonatomic) IBOutlet UIImageView *feedImage;
@property (weak, nonatomic) IBOutlet UIScrollView *feedScroll;

@end

@implementation FeedViewController

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self.feedScroll layoutIfNeeded];
    self.feedScroll.contentSize = self.feedImage.bounds.size;
}

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
    
    self.indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.indicatorView.center = self.view.center;
    [self.view addSubview:self.indicatorView];
    
    //init scrollview as hidden
    self.feedScroll.hidden = YES;
    
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    LoginViewController *lvc = [[LoginViewController alloc] init];
    
    lvc.modalTransitionStyle = UIModalTransitionStyleCoverVertical; // Rises from below
    
    if (self.hasPresentedLogin) {
        if (self.hasPresentedLogin) {
            [self.indicatorView startAnimating];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.indicatorView stopAnimating];
                self.feedScroll.hidden = NO;
            });
        }
    }
    
    else [self presentViewController:lvc animated:NO completion:nil];
    self.hasPresentedLogin = YES;
   

    


    
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
