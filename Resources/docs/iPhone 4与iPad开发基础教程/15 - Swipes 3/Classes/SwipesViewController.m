//
//  SwipesViewController.m
//  Swipes
//
//  Created by Dave Mark on 12/15/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SwipesViewController.h"

#define kMinimumGestureLength    25
#define kMaximumVariance         5

@implementation SwipesViewController
@synthesize label;
@synthesize gestureStartPoint;

- (void)eraseText {
    label.text = @"";
}


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    UISwipeGestureRecognizer *vertical;
    
    for (NSUInteger touchCount = 1; touchCount <= 5; touchCount++) {
        vertical = [[[UISwipeGestureRecognizer alloc] initWithTarget:self
															  action:@selector(reportVerticalSwipe:)] autorelease];
        vertical.direction = UISwipeGestureRecognizerDirectionUp| 
		UISwipeGestureRecognizerDirectionDown;
        vertical.numberOfTouchesRequired = touchCount;
        [self.view addGestureRecognizer:vertical];
		
        UISwipeGestureRecognizer *horizontal;
        horizontal = [[[UISwipeGestureRecognizer alloc] initWithTarget:self
																action:@selector(reportHorizontalSwipe:)] autorelease];
        horizontal.direction = UISwipeGestureRecognizerDirectionLeft| 
		UISwipeGestureRecognizerDirectionRight;
        horizontal.numberOfTouchesRequired = touchCount;
        [self.view addGestureRecognizer:horizontal];
    }
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.label = nil;
    [super viewDidUnload];
}

- (void)dealloc {
    [label release];
    [super dealloc];
}

- (NSString *)descriptionForTouchCount:(NSUInteger)touchCount {
    if (touchCount == 2)
        return @"Double ";
    else if (touchCount == 3)
        return @"Triple ";
    else if (touchCount == 4)
        return @"Quadruple ";
    else if (touchCount == 5)
        return @"Quintuple ";
    else
        return @"";
}

#pragma mark -
- (void)reportHorizontalSwipe:(UIGestureRecognizer *)recognizer {
    label.text = [NSString stringWithFormat:@"%@Horizontal swipe detected",
				  [self descriptionForTouchCount:[recognizer numberOfTouches]]];
    [self performSelector:@selector(eraseText) withObject:nil afterDelay:2];
}

- (void)reportVerticalSwipe:(UIGestureRecognizer *)recognizer {
    label.text = [NSString stringWithFormat:@"%@Vertical swipe detected",
				  [self descriptionForTouchCount:[recognizer numberOfTouches]]];;
    [self performSelector:@selector(eraseText) withObject:nil afterDelay:2];
}

@end
