// Tests the AddressCard Class
// Chapter 15 exercises 2, 3, 4, 5 and 6.
#import "AddressBook.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        AddressBook *book;
        NSProcessInfo *proc = [NSProcessInfo processInfo];
        NSArray *args = [proc arguments];
        NSString *lookUpFor;
        NSMutableArray *lookupResults;

        if ([args count] != 2) {
            NSLog(@"Could not process lookup\nUsage: ./lookup name");
            return 1;
        }

        lookUpFor = [args objectAtIndex:1];
        book = [NSKeyedUnarchiver unarchiveObjectWithFile:@"mybook.archive"];

        if (!book) {
            NSLog(@"Error reading from archived address book.");
            NSLog(@"Verify the archive exists at location ./");
            return 2;
        }

        lookupResults = [book lookup:lookUpFor];

        if (!lookupResults) {
            NSLog(@"Sorry, could not find %@!", lookUpFor);
        }
        else {
            for (AddressCard *card in lookupResults) {
                [card print];
            }
        }
    }

    return 0;
}
