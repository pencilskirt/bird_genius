#import "ViewController.h"
#import "NSMutableArray+Shuffle.h"

@interface ViewController ()

@end

@implementation ViewController



-(void)viewDidLoad {
    [super viewDidLoad];
    _answerButton.hidden = YES;
    _nameLabel.text = @"Swipe to begin; tap to reveal bird name.";
    _birdImageView.image = [UIImage imageNamed:@"birdlogo.png"];
    
}




- (IBAction)tapForAnswer:(UITapGestureRecognizer *)sender {
        _nameLabel.hidden = NO;
}


- (IBAction)swipeCardLeft:(id)sender {
    NSDictionary *birdDict = [[NSDictionary alloc] initWithObjectsAndKeys:
                              @"01.jpg",@"Barred Owl,'Strix varia', Jill Jones",
                              @"02.jpg",@"Bufflehead, 'Bucephala albeola', Marty Klein",
                              @"03.jpg",@"Caspian Tern, 'Hydroprogne caspia', Amos Waller",
                              @"04.jpg",@"Common Yellowthroat, 'Geotylpis trichas', Marty Klein",
                              @"05.jpg",@"Long-billed Dowitcher, 'Limnodromus scolopaceus', Jill Jones",
                              @"06.jpg",@"American Goldfinch, 'Spinus tristis'",
                              @"07.jpg",@"Rose-breasted Grosbeak, 'Pheuticus ludovicianus'",
                              @"08.jpg",@"Harris' Sparrow, 'Zonotrichi querula'",
                              @"09.jpg",@"House Finch, 'Haemorhous mexicanus",
                              nil];
    
    _randomIndex = arc4random()% [birdDict count];
    
    NSArray *myKeys = [birdDict allKeys];
    
    
    NSInteger index = (NSInteger)[self randomIndex];
    
    NSString *thisKey = [myKeys objectAtIndex: index];
    NSString *thisObject = [birdDict objectForKey: thisKey];
    
    _nameLabel.hidden = YES;
    _nameLabel.text = thisKey;
    _birdImageView.image = [UIImage imageNamed:thisObject];
    
}

- (IBAction)swipeCardRight:(UISwipeGestureRecognizer *)sender {
    //
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end