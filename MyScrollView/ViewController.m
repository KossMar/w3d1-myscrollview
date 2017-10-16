//
//  ViewController.m
//  MyScrollView
//
//  Created by Mar Koss on 2017-10-16.
//  Copyright © 2017 Mar Koss. All rights reserved.
//

#import "ViewController.h"
#import "MyScrollView.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet MyScrollView *myScrollView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myScrollView.scrollLimit = CGSizeMake(0, 200);
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panView:)];
    [self.myScrollView addGestureRecognizer:panGesture];

}

- (void)panView:(UIPanGestureRecognizer*)sender {
    CGPoint movedPoint = [sender translationInView:self.view];
    CGFloat x = movedPoint.x;
    CGFloat y = movedPoint.y;
    NSNumber *x1 = [NSNumber numberWithDouble:movedPoint.x];
    NSNumber *y1 = [NSNumber numberWithDouble:movedPoint.y];
    NSLog(@"%@ , %@", [x1 stringValue], [y1 stringValue]);
    
    if (self.view.bounds.origin.y > self.myScrollView.scrollLimit.height) {
        CGRect limit = self.view.bounds;
        limit.origin.y = self.myScrollView.scrollLimit.height;
        self.view.bounds = limit;
    }
    
    else if (self.view.bounds.origin.y < -(self.myScrollView.scrollLimit.height)) {
        CGRect limit = self.view.bounds;
        limit.origin.y = -(self.myScrollView.scrollLimit.height);
        self.view.bounds = limit;
    }
    
    else {
    CGRect origin = self.view.bounds;
    origin.origin.y = origin.origin.y + y;
    self.view.bounds = origin;
    [sender setTranslation:CGPointZero inView:self.view];
    CGFloat thing = self.view.bounds.origin.y;
    NSNumber *thing2 = [NSNumber numberWithDouble:thing];
    NSLog(@"%@", thing2);
    }
    

    
//    self.view
//    if (moved > self.myScrollView.scrollLimit) {
    
//    }
    
}

- (void)viewDidAppear:(BOOL)animated {
    CGRect origin = self.view.bounds;
    origin.origin.y = origin.origin.y + 100;
    self.view.bounds = origin;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
