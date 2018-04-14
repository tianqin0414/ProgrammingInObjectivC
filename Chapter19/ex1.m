// ex1.m -- Generates a table of prime numbers and stores it in an array
// which is then stored inside a primes.pl XML(plist) file.
#import <Foundation/Foundation.h>

int main(int argc, char *argv[])
{
    @autoreleasepool {
        int p, d;
        BOOL isPrime;
        NSMutableArray *primes = [[NSMutableArray alloc] init];

        for (p = 2; p <= 50; ++p) {
            isPrime = YES;
            for (d = 2; d < p; ++d) {
                if (p % d == 0)
                    isPrime = NO;
            }
            if (isPrime == YES)
                [primes addObject:[NSNumber numberWithInteger:p]];
        }

        if ([primes writeToFile:@"primes.pl" atomically:YES] == NO)
            NSLog(@"Save to file failed!");
        else
            NSLog(@"Wrote primes to file primes.pl.");
    }

    return 0;
}
