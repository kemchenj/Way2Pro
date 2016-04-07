//
//  main.m
//  Block
//
//  Created by kemchenj on 4/7/16.
//  Copyright © 2016 kemchenj. All rights reserved.
//

#import <Cocoa/Cocoa.h>

void logBlock( int ( ^ theBlock )( void ) )
{
    NSLog( @"Closure var X: %i", theBlock() );
}

int main( void )
{
    int ( ^ myBlock )( void );
    int x;
    
    x = 41;
    myBlock = ^( void ) { int a=x+3; return a; };
    logBlock( myBlock );
    x = 42;
    
    logBlock( myBlock );
    
    return EXIT_SUCCESS;
}