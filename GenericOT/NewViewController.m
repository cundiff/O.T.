//
//  NewViewController.m
//  GenericOT
//
//  Created by Ian Cundiff on 8/22/11.
//  Copyright 2011 Rose-Hulman. All rights reserved.
//

#import "NewViewController.h"

#define CAR_PAGE @"http://www.fueleconomy.gov/m/m.do?action=vehicles&id="
#define TANK_SIZE_URL @"http://www.fueleconomy.gov/m/m.do?action=vehicles&econ=open&id="

@implementation NewViewController

@synthesize carSelector;

BOOL combinedFound, distanceFound;
int combined;
int distance;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadResultsView) name:@"loadResults" object:nil];
    
    [carSelector loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.fueleconomy.gov/m/GetYear.jsp"]]];
    combinedFound = NO;
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSString *stringURL = [[request URL] absoluteString];
    
    if ([stringURL hasPrefix:CAR_PAGE]) {
        
        //a little convoluted...
        NSString *tankURLString = [TANK_SIZE_URL stringByAppendingString:[stringURL substringFromIndex:[stringURL length]-5]];
        
        NSURLRequest *tankRequest = [[NSURLRequest alloc] initWithURL: [[NSURL alloc] initWithString:tankURLString]];
        
        [self parseURLRequest:tankRequest];
        
        return YES;
    } else {
        return YES;
    }
}

-(void)loadResultsView {
    ResultsViewController *results = [[ResultsViewController alloc] init];
    [results setCombinedMPG:[NSNumber numberWithInt:combined]];
    [results setDistance:[NSNumber numberWithInt:distance]];
    [self.navigationController pushViewController:results animated:YES];
}

-(void)parseURLRequest:(NSURLRequest *)request {
    HTMLParser *p = [[HTMLParser alloc] initWithContentsOfURL:[request URL] error:nil];
    
    HTMLNode *bodyNode = [p body];
    
    NSArray *spanNodes = [bodyNode findChildTags:@"p"];
    
    //dirty, but it works
    NSMutableArray *numberArray = [[NSMutableArray alloc] init];
    
    for (HTMLNode *spanNode in spanNodes) {
        if ([[spanNode getAttributeNamed:@"class"] isEqualToString:@"veh mpg"]) {
            
            NSString *mpgString = [[[spanNode rawContents] componentsSeparatedByCharactersInSet:
                                    [[NSCharacterSet decimalDigitCharacterSet] invertedSet]] 
                                   componentsJoinedByString:@""];
            [numberArray addObject:mpgString];
            
        }
    }
    combined = [[numberArray objectAtIndex:0] intValue];
    combinedFound = YES;
    distance = [[numberArray lastObject] intValue]; //consider revising to better account for E85
    distanceFound = YES;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"loadResults" object:nil];

}


- (IBAction)homeButtonPressed:(id)sender {
    [self.navigationController pushViewController:[RootViewController alloc] animated:NO];
}

@end
