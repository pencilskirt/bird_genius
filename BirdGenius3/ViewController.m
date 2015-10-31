//
//  ViewController.m
//  BirdGenius3
//
//  Created by The Ingolds on 10/2/15.
//  Copyright © 2015 Pencilskirt Studio. All rights reserved.
//

#import "ViewController.h"
#import "NSMutableArray+Shuffle.h"
#import "Bird.h"

@interface ViewController ()


@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.birdArray = [[NSMutableArray alloc]init];
    Bird *bird1 = [[Bird alloc] initWithImage:[UIImage imageNamed:@"1.png"] name:@"Robin" latinName:@"Robinus Minimus" photogName:@"Franny Snaps"];
    [self.birdArray addObject:bird1];
    
    Bird *bird2 = [[Bird alloc] initWithImage:[UIImage imageNamed:@"2.png"] name:@"Robin" latinName:@"Robinus Minimus" photogName:@"Franny Snaps"];
    [self.birdArray addObject:bird2];
    Bird *bird3 = [[Bird alloc] initWithImage:[UIImage imageNamed:@"3.png"] name:@"Robin" latinName:@"Robinus Minimus" photogName:@"Franny Snaps"];
    [self.birdArray addObject:bird3];
    Bird *bird4 = [[Bird alloc] initWithImage:[UIImage imageNamed:@"4.png"] name:@"Robin" latinName:@"Robinus Minimus" photogName:@"Franny Snaps"];
    [self.birdArray addObject:bird4];
    
    self.index = 0;
    
    self.birdArray = [self bjl_shuffledArray];
}


- (NSMutableArray *)bjl_shuffledArray
{
    NSMutableArray *shuffledArray = [self.birdArray mutableCopy];
    NSUInteger arrayCount = [shuffledArray count];
    
    for (NSUInteger i = arrayCount - 1; i > 0; i--) {
        NSUInteger n = arc4random_uniform(i + 1);
        [shuffledArray exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
    return [shuffledArray copy];
}


- (IBAction)swipeCardLeft:(id)sender {

    self.index++;
    if (self.index > self.birdArray.count-1) {
        self.index = 0;
    }
  
    Bird *currentBird = [self.birdArray objectAtIndex:self.index];
  
    
    _nameLabel.text = currentBird.name;
    _birdImageView.image = currentBird.image;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

