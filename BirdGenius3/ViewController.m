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
#import <Parse/Parse.h>
#import <ParseUI/ParseUI.h>


@interface ViewController ()
@end



@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
 
    
    PFQuery *query = [PFQuery queryWithClassName:@"Bird"];
    [query whereKey:@"region" equalTo:@"Americas"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            _birdArray = [[NSMutableArray alloc]init];
            _birdArray = [NSMutableArray arrayWithArray: objects];
            NSLog(@"number of objects %lu", (unsigned long)objects.count);
        } else {
            NSString *errorString = [[error userInfo] objectForKey:@"error"];
            NSLog(@"Error: %@", errorString);
        }
        
            self.index = 0;
            self.birdArray = [self bjl_shuffledArray];
        
        PFObject *currentBird = [self.birdArray objectAtIndex:self.index];
        _nameLabel.text = [currentBird objectForKey:@"name"];
        _latinName.text = [currentBird objectForKey:@"latinName"];
        _photogName.text = [currentBird objectForKey:@"photogName"];
        
        PFFile *file = [currentBird objectForKey:@"image"];
        _imageFileURL = [[NSURL alloc]initWithString:file.url];
        NSData *imageData = [NSData dataWithContentsOfURL:_imageFileURL];
        _birdImageView.image =[UIImage imageWithData:imageData];
        
//        
//            NSLog(@"shuffledArray: %@", _birdArray);
//            NSLog(@"number of birdArray %lu", (unsigned long)_birdArray.count);
//        
        
    }];

//
//    self.birdArray = [[NSMutableArray alloc]init];
//    Bird *bird1 = [[Bird alloc] initWithImageURL:@"http://pencilskirtstudio.com/bird_genius/01.jpg"
//                                            name:@"Barred Owl"
//                                       latinName:@"Strix varia"
//                                      photogName:@"Jane Photographer"];
//    [self.birdArray addObject:bird1];
//    
//    
//    Bird *bird2 = [[Bird alloc] initWithImageURL:@"http://pencilskirtstudio.com/bird_genius/02.jpg"
//                                            name:@"Bufflehead"
//                                       latinName:@"Bucephala albeola"
//                                      photogName:@"Joe Photographer"];
//    [self.birdArray addObject:bird2];
//    
//    
//    Bird *bird3 = [[Bird alloc] initWithImageURL:@"http://pencilskirtstudio.com/bird_genius/03.jpg"
//                                            name:@"Caspian Tern"
//                                       latinName:@"Hydroprogne caspia"
//                                      photogName:@"Jane Photographer"];
//    [self.birdArray addObject:bird3];
//    
//    
//    Bird *bird4 = [[Bird alloc] initWithImageURL:@"http://pencilskirtstudio.com/bird_genius/04.jpg"
//                                            name:@"Common Yellowthroat"
//                                       latinName:@"Geothlypis trichas"
//                                      photogName:@"Joe Photographer"];
//    [self.birdArray addObject:bird4];
//    
//    Bird *bird5 = [[Bird alloc] initWithImageURL:@"http://pencilskirtstudio.com/bird_genius/05.jpg"
//                                            name:@"Long-billed Dowitcher"
//                                       latinName:@"Limnodromus scolopaceus"
//                                      photogName:@"Joe Photographer"];
//    [self.birdArray addObject:bird5];
//    
//    Bird *bird6 = [[Bird alloc] initWithImageURL:@"http://pencilskirtstudio.com/bird_genius/06.jpg"
//                                            name:@"American Goldfinch"
//                                       latinName:@"Spinus tristis"
//                                      photogName:@"Joe Photographer"];
//    [self.birdArray addObject:bird6];
//    
//    
//    Bird *bird7 = [[Bird alloc] initWithImageURL:@"http://pencilskirtstudio.com/bird_genius/07.jpg"
//                                            name:@"Rose-breasted Grosbeak"
//                                       latinName:@"Pheucticus ludovicianus"
//                                      photogName:@"Joe Photographer"];
//    [self.birdArray addObject:bird7];
//    
//    
//    Bird *bird8 = [[Bird alloc] initWithImageURL:@"http://pencilskirtstudio.com/bird_genius/08.jpg"
//                                            name:@"Harris' Sparrow"
//                                       latinName:@"Zonotrichia querula"
//                                      photogName:@"Joe Photographer"];
//    [self.birdArray addObject:bird8];
//    
//    
//    Bird *bird9 = [[Bird alloc] initWithImageURL:@"http://pencilskirtstudio.com/bird_genius/09.jpg"
//                                            name:@"House Finch"
//                                       latinName:@"Haemorhous mexicanus"
//                                      photogName:@"Joe Photographer"];
//    [self.birdArray addObject:bird9];
//    
//    
//    Bird *bird10 = [[Bird alloc] initWithImageURL:@"http://pencilskirtstudio.com/bird_genius/10.jpg"
//                                            name:@"Belted Kingfisher"
//                                       latinName:@"Megaceryle alcyon"
//                                      photogName:@"Joe Photographer"];
//    [self.birdArray addObject:bird10];
    
    
//    self.index = 0;
//    
//    self.birdArray = [self bjl_shuffledArray];

//
//    Bird *currentBird = [self.birdArray objectAtIndex:self.index];
//    _photogName.text = currentBird.photogName;
//    _latinName.text = currentBird.latinName;
//    _nameLabel.text = currentBird.name;
//    _birdImageView.image = currentBird.image;
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
  
    PFObject *currentBird = [self.birdArray objectAtIndex:self.index];
    _nameLabel.text = [currentBird objectForKey:@"name"];
    _latinName.text = [currentBird objectForKey:@"latinName"];
    _photogName.text = [currentBird objectForKey:@"photogName"];
    
    PFFile *file = [currentBird objectForKey:@"image"];
    _imageFileURL = [[NSURL alloc]initWithString:file.url];
    NSData *imageData = [NSData dataWithContentsOfURL:_imageFileURL];
    _birdImageView.image =[UIImage imageWithData:imageData];
    
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
    PFObject *currentBird = [self.birdArray objectAtIndex:self.index];
    _nameLabel.text = [currentBird objectForKey:@"name"];
    _latinName.text = [currentBird objectForKey:@"latinName"];
    _photogName.text = [currentBird objectForKey:@"photogName"];
    
    PFFile *file = [currentBird objectForKey:@"image"];
    _imageFileURL = [[NSURL alloc]initWithString:file.url];
    NSData *imageData = [NSData dataWithContentsOfURL:_imageFileURL];
    _birdImageView.image =[UIImage imageWithData:imageData];

    
    
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


@end

