//
//  ViewController.m
//  BirdGenius3
//
//  Created by The Ingolds on 10/2/15.
//  Copyright © 2015 Pencilskirt Studio. All rights reserved.
//

#import "ViewController.h"
#import "NSMutableArray+Shuffle.h"
#import <CloudKit/CloudKit.h>
#import "Bird.h"

@interface ViewController ()
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
 
    CKDatabase *publicDB = [[CKContainer defaultContainer] publicCloudDatabase];
    NSPredicate *predicate = [NSPredicate predicateWithValue:YES];
    CKQuery *query = [[CKQuery alloc] initWithRecordType:@"Bird" predicate:predicate];
    [publicDB performQuery:query inZoneWithID:nil completionHandler:^(NSArray *results, NSError *error) {
        _birdArray = [[NSMutableArray alloc] init];
        for (CKRecord *record in results) {
            CKAsset *birdImage = [record objectForKey:@"image"];
            UIImage *image = [[UIImage alloc] initWithContentsOfFile:birdImage.fileURL.path];
            Bird *thisBird = [[Bird alloc] initWithImage:image name:[record objectForKey:@"title"] latinName:[record objectForKey:@"latinName"] photogName:[record objectForKey:@"photogName"]];
            [self.birdArray addObject:thisBird];
        }
        self.index = 0;
        [self loadBird];
    }];
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
    
    [UIView animateWithDuration:0.25 animations:^{
        self.birdImageView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
        self.birdImageView.transform = CGAffineTransformIdentity;
    }];

    self.index++;
    if (self.index > self.birdArray.count-1) {
        self.index = 0;
    }
  
    [self loadBird];
}


- (IBAction)swipeCardRight:(id)sender {
    
    [UIView animateWithDuration:0.25 animations:^{
        self.birdImageView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
        self.birdImageView.transform = CGAffineTransformIdentity;
    }];
    
    self.index--;
    if (self.index < 0) {
        self.index = self.birdArray.count-1;
    }
    [self loadBird];
}

- (IBAction)handlePinch:(UIPinchGestureRecognizer *)recognizer {
    recognizer.view.transform = CGAffineTransformScale(recognizer.view.transform, recognizer.scale, recognizer.scale);
    recognizer.scale = 1;
}

- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer {
    
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,
                                         recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    
}
- (IBAction)handleDoubleTap:(UITapGestureRecognizer *)recognizer {
    [UIView animateWithDuration:0.25 animations:^{
        self.birdImageView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
        self.birdImageView.transform = CGAffineTransformIdentity;
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadBird {
    Bird *currentBird = [self.birdArray objectAtIndex:self.index];
    _nameLabel.text = currentBird.name;
    _latinName.text = currentBird.latinName;
    _photogName.text = currentBird.photogName;
    _birdImageView.image = currentBird.image;
}

@end

