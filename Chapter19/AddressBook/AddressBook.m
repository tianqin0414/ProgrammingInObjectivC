// Implementation file for AddressBook
// Chapter 15 exercises 2, 3, 4, 5 and 6.
#import "AddressBook.h"

@implementation AddressBook

@synthesize bookName;
@synthesize book;

- (id)copyWithZone:(NSZone *)zone
{
    id newBook = [[[self class] allocWithZone:zone] init];
    [newBook setBookName: bookName];

    /* Performs a deep copy of AddressBook traversing through each card */
    for (AddressCard *element in book) {
        AddressCard *newCard = [element copy];
        [newBook addCard:newCard];
    }

    return newBook;
}

- (id) initWithName: (NSString *) name
{
    self = [super init];

    if (self) {
        bookName = [NSString stringWithString: name];
        book = [NSMutableArray array];
    }

    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:bookName forKey:@"AddressBook-BookName"];
    [encoder encodeObject:book forKey:@"AddressBook-Book"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    bookName = [decoder decodeObjectForKey:@"AddressBook-BookName"];
    book = [decoder decodeObjectForKey:@"AdressBook-Book"];

    return self;
}

/**
 * Overrides the default init and sets the name to "NoName".
 */
 - (id) init
 {
    return [self initWithName: @"NoName"];
}

- (void) addCard: (AddressCard *) theCard
{
    [book addObject: theCard];
}

- (void) removeCard: (AddressCard *) theCard
{
    [book removeObject: theCard];
}

- (NSMutableArray *) lookup: (NSString *) theName
{
    NSMutableArray *result = [[NSMutableArray alloc] init];

    for (AddressCard *next in book) {
        if ([next lookupCardForString: theName] == YES)
            [result addObject: next];
    }

    if ([result count] == 0)
        return nil;

    return result;
}

- (BOOL) removeName: (NSString *) theName
{
    NSMutableArray *lookupResults = [[NSMutableArray alloc] init];
    lookupResults = [self lookup: theName];
    if ([lookupResults count] == 1) {
        [book removeLastObject];
        return YES;
    }
    else
        return NO;
}

- (NSUInteger) entries
{
    return [book count];
}

- (void) sort
{
    [book sortUsingComparator:
        ^(id obj1, id obj2) {
            return [[obj1 name] compare: [obj2 name]];
        }];
}

- (void) list
{
    NSLog(@" ");
    NSLog(@"======== Contents of: %@ =======", bookName);

    for (AddressCard* theCard in book) {
        NSMutableString *fullName = [[NSMutableString alloc] init];
        [fullName appendString: theCard.fname];
        [fullName appendString: @" "];
        [fullName appendString: theCard.lname];

        NSMutableString *address = [[NSMutableString alloc] init];
        [address appendString: theCard.city];
        [address appendString: @", "];
        [address appendString: theCard.state];
        [address appendString: @", "];
        [address appendString: theCard.zip];
        NSLog(@"*************************************");
        NSLog(@"*                                   *");
        NSLog(@"*  %-32s *", [fullName UTF8String]);
        NSLog(@"*  %-32s *", [address UTF8String]);
        NSLog(@"*  %-32s *", [theCard.country UTF8String]);
        NSLog(@"*  %-32s *", [theCard.phone UTF8String]);
        NSLog(@"*  %-32s *", [theCard.email UTF8String]);
        NSLog(@"*                                   *");
        NSLog(@"*************************************");
        NSLog(@" ");
    }

    NSLog(@"=============================================================");

}
@end
