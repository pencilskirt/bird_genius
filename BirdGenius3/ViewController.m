//
//  ViewController.m
//  BirdGenius3
//
//  Created by The Ingolds on 10/2/15.
//  Copyright © 2015 Pencilskirt Studio. All rights reserved.
//

#import "ViewController.h"
#import "NSMutableArray+Shuffle.h"
@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
}




- (IBAction)swipeCardLeft:(id)sender {
    NSDictionary *birdDict = [[NSDictionary alloc] initWithObjectsAndKeys:
                              @"1.png",@"robin",
                              @"2.png",@"chaffinch",
                              @"3.png",@"doves",
                              @"4.png",@"kestrel",
                              nil];
    
    _randomIndex = arc4random()% [birdDict count];
    
    NSArray *myKeys = [birdDict allKeys];

    
    NSInteger index = (NSInteger)[self randomIndex];
    
    NSString *thisKey = [myKeys objectAtIndex: index];
    NSString *thisObject = [birdDict objectForKey: thisKey];
    
    _nameLabel.text = thisKey;
    _birdImageView.image = [UIImage imageNamed:thisObject];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

