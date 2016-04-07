// #import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>

void logBlock( int ( ^ theBlock )( void ) )
{
    NSLog( @"Closure var X: %i", theBlock() );
}

int main( void )
{
    int ( ^ myBlock )( void );
    int x;

    x = 42;

    myBlock = ^( void )
    {
        return x;
    };

    logBlock( myBlock );

    return EXIT_SUCCESS;
}
