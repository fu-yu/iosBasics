//
//  ViewController.m
//  Opening
//
//  Created by 藤井 裕子 on 12/02/01.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "SplashPageViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
	UIView *rootView = [[UIView alloc] initWithFrame:screenBounds];
	rootView.backgroundColor = [UIColor redColor]; //わかりやすいように赤背景にする
	self.view = rootView;
	[rootView release];
}

- (void)viewDidUnload
{
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
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void)showSplash
{
    
    SplashPageViewController *modalViewController = [[SplashPageViewController alloc] init];
    
    [self presentModalViewController:modalViewController animated:NO];
    [self performSelector:@selector(hideSplash) withObject:nil afterDelay:5.0];
    [modalViewController release];
    
}

-(void)hideSplash{
    NSLog(@"hideSplash");
    [[self modalViewController] dismissModalViewControllerAnimated:NO];
}
@end
