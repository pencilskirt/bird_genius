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
    
    //Parse test
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    testObject[@"name"] = @"Robin";
    [testObject saveInBackground];
    
    // Do any additional setup after loading the view, typically from a nib.

    self.birdArray = [[NSMutableArray alloc]init];
    Bird *bird1 = [[Bird alloc] initWithImageURL:@"http://pencilskirtstudio.com/bird_genius/01.jpg"
                                            name:@"Barred Owl"
                                       latinName:@"Strix varia"
                                      photogName:@"Jane Photographer"];
    [self.birdArray addObject:bird1];
    
    
    Bird *bird2 = [[Bird alloc] initWithImageURL:@"http://pencilskirtstudio.com/bird_genius/02.jpg"
                                            name:@"Bufflehead"
                                       latinName:@"Bucephala albeola"
                                      photogName:@"Joe Photographer"];
    [self.birdArray addObject:bird2];
    
    
    Bird *bird3 = [[Bird alloc] initWithImageURL:@"http://pencilskirtstudio.com/bird_genius/03.jpg"
                                            name:@"Caspian Tern"
                                       latinName:@"Hydroprogne caspia"
                                      photogName:@"Jane Photographer"];
    [self.birdArray addObject:bird3];
    
    
    Bird *bird4 = [[Bird alloc] initWithImageURL:@"http://pencilskirtstudio.com/bird_genius/04.jpg"
                                            name:@"Common Yellowthroat"
                                       latinName:@"Geothlypis trichas"
                                      photogName:@"Joe Photographer"];
    [self.birdArray addObject:bird4];
    
    Bird *bird5 = [[Bird alloc] initWithImageURL:@"http://pencilskirtstudio.com/bird_genius/05.jpg"
                                            name:@"Long-billed Dowitcher"
                                       latinName:@"Limnodromus scolopaceus"
                                      photogName:@"Joe Photographer"];
    [self.birdArray addObject:bird5];
    
    Bird *bird6 = [[Bird alloc] initWithImageURL:@"http://pencilskirtstudio.com/bird_genius/06.jpg"
                                            name:@"American Goldfinch"
                                       latinName:@"Spinus tristis"
                                      photogName:@"Joe Photographer"];
    [self.birdArray addObject:bird6];
    
    
    Bird *bird7 = [[Bird alloc] initWithImageURL:@"http://pencilskirtstudio.com/bird_genius/07.jpg"
                                            name:@"Rose-breasted Grosbeak"
                                       latinName:@"Pheucticus ludovicianus"
                                      photogName:@"Joe Photographer"];
    [self.birdArray addObject:bird7];
    
    
    Bird *bird8 = [[Bird alloc] initWithImageURL:@"http://pencilskirtstudio.com/bird_genius/08.jpg"
                                            name:@"Harris' Sparrow"
                                       latinName:@"Zonotrichia querula"
                                      photogName:@"Joe Photographer"];
    [self.birdArray addObject:bird8];
    
    
    Bird *bird9 = [[Bird alloc] initWithImageURL:@"http://pencilskirtstudio.com/bird_genius/09.jpg"
                                            name:@"House Finch"
                                       latinName:@"Haemorhous mexicanus"
                                      photogName:@"Joe Photographer"];
    [self.birdArray addObject:bird9];
    
    
    Bird *bird10 = [[Bird alloc] initWithImageURL:@"http://pencilskirtstudio.com/bird_genius/10.jpg"
                                            name:@"Belted Kingfisher"
                                       latinName:@"Megaceryle alcyon"
                                      photogName:@"Joe Photographer"];
    [self.birdArray addObject:bird10];
    
    
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
    _photogName.text = currentBird.photogName;
    _latinName.text = currentBird.latinName;
    _nameLabel.text = currentBird.name;
    _birdImageView.image = currentBird.image;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

