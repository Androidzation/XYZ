//
//  MyAnnotation.m
//  storelocator
//
//  Testingxyz on 30/06/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MyAnnotation.h"


@implementation MyAnnotation

@synthesize coordinate, title, subtitle,AnnotationID;

-(void)dealloc
{
    [title release];
    [subtitle release];
    [super dealloc];
}

@end
