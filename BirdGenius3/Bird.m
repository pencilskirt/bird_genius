//
//  Bird.m
//  BirdGenius3
//
//  Created by Lea Ingold on 10/27/15.
//  Copyright © 2015 Pencilskirt Studio. All rights reserved.
//

#import "Bird.h"


@implementation Bird

-(id)initWithImage:(UIImage *)image name:(NSString *)name latinName:(NSString *)latinName photogName:(NSString *)photogName
{
    if(self = [super init]) {
        
        self.name = name;
        self.latinName = latinName;
        self.photogName = photogName;
        self.image = image;
    }
    return self;
}


@end
