// ex2.m -- Reads in the primes.pl file that was stored in ex1.m and outputs it
// to the console
#import <Foundation/Foundation.h>

int main(int argc, char *argv[])
{
    @autoreleasepool {
        NSMutableArray *primes;
        primes = [NSMutableArray arrayWithContentsOfFile:@"primes.pl"];

        if (!primes) {
            NSLog(@"Reading from primes.pl failed!");
            return 1;
        }

        NSLog(@"Primes from primes.pl: ");
        int i;
        for (i = 0; i < [primes count]; i++) {
            NSLog(@"%@", [primes objectAtIndex:i]);
        }
    }

    return 0;
}
