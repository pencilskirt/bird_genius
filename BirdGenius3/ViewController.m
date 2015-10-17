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

-(id)init {
    if(self = [super init])
    {
        //declare variables

        NSDictionary *birdDict;
        //NSArray *shuffledKeys;
        NSArray *myKeys;
        NSInteger *index;
        NSString *thisKey;
        NSString *thisObject;
        
        
        //declare dictionary
        
        _birdDict = [[NSDictionary alloc] initWithObjectsAndKeys:
                                  @"01.jpg",@"Barred Owl",
                                  @"02.jpg",@"Bufflehead",
                                  @"03.jpg",@"Caspian Tern",
                                  @"04.jpg",@"Common Yellowthroat",
                                  //@"05.jpg",@"Long-billed Dowitcher",
                                  nil];
        
        //initialize index to 0;
        
        //shuffle keys
        _randomIndex = arc4random()% [_birdDict count];
        myKeys = [birdDict allKeys];
        //create a true shuffle function
        //run shuffle function on myKeys and store in shuffledKeys:     _shuffledKeys = [self shuffle:myKeys];
        
        
        
        
        
        
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _birdImageView.image = [UIImage imageNamed:@"01.jpg"];
    // set initial index
    _index = 0;
    
    
}

- (IBAction)answerReveal:(UIButton *)sender {
    //reveal answer when button is clicked
    _nameLabel.hidden = NO;
}



- (IBAction)swipeCardLeft:(id)sender {
    //set answer to hidden
        _nameLabel.hidden = YES;
    //[shuffledKeys objectAtIndex:index];
    //index++; if index > shuffledKeys.length {index = 0; _shuffledKeys = [self shuffle:myKeys];

    _index = (NSInteger)[self randomIndex];
    
    _thisKey = [_myKeys objectAtIndex: index];
    _thisObject = [_birdDict objectForKey: _thisKey];
    
    _nameLabel.text = _thisKey;
    _birdImageView.image = [UIImage imageNamed:_thisObject];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

