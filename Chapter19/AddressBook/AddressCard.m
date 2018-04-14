// Implementation file for AddressCard.
// Chapter 15 exercises 2, 3, 4, 5 and 6.
#import "AddressCard.h"

@implementation AddressCard

@synthesize fname, lname, email, state, city;
@synthesize zip, country, phone;

- (id) copyWithZone:(NSZone *)zone
{
    id newCard = [[[self class] allocWithZone:zone] init];
    [newCard setFName:fname andLName:lname andEmail:email andState:state
            andCity:city andZip:zip andCountry:country andPhone:phone];

    return newCard;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:fname forKey:@"AddressCard-FName"];
    [encoder encodeObject:lname forKey:@"AddressCard-LName"];
    [encoder encodeObject:email forKey:@"AddressCard-Email"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
    fname = [decoder decodeObjectForKey:@"AddressCard-FName"];
    lname = [decoder decodeObjectForKey:@"AddressCard-LName"];
    email = [decoder decodeObjectForKey:@"AddressCard-Email"];

    return self;
}

- (void) setFName: (NSString *) first andLName: (NSString *) last
    andEmail: (NSString*) theEmail
{
    self.fname      = first;
    self.lname      = last;
    self.email      = theEmail;
    // Set the others too so that enumerations in AddressBook don't print null
    self.state      = @" ";
    self.city       = @" ";
    self.zip        = @" ";
    self.country    = @" ";
    self.phone      = @" ";
}

- (void) setFName: (NSString* ) first andLName: (NSString *) last
    andEmail: (NSString*) theEmail andState: (NSString*) State
    andCity: (NSString *) City andZip: (NSString *) Zip
    andCountry: (NSString *) Country andPhone: (NSString *) pnumber
{
    self.fname      = first;
    self.lname      = last;
    self.email      = theEmail;
    self.state      = State;
    self.city       = City;
    self.zip        = Zip;
    self.country    = Country;
    self.phone      = pnumber;
}

- (BOOL) isEqual: (AddressCard *) theCard
{
    if ([self.fname isEqualToString: theCard.fname]     == YES &&
        [self.email isEqualToString: theCard.email]     == YES &&
        [self.lname isEqualToString: theCard.lname]     == YES &&
        [self.state isEqualToString: theCard.email]     == YES &&
        [self.city isEqualToString: theCard.city]       == YES &&
        [self.zip isEqualToString: theCard.zip]         == YES &&
        [self.country isEqualToString: theCard.country] == YES &&
        [self.phone isEqualToString: theCard.phone]     == YES)
        return YES;
    else
        return NO;

}

- (BOOL) lookupCardForString: (NSString *) str
{
    if ([[self fname] rangeOfString: str
            options: NSCaseInsensitiveSearch].location != NSNotFound ||
        [[self lname] rangeOfString: str
            options: NSCaseInsensitiveSearch].location != NSNotFound ||
        [[self city] rangeOfString: str
            options: NSCaseInsensitiveSearch].location != NSNotFound ||
        [[self state] rangeOfString: str
            options: NSCaseInsensitiveSearch].location != NSNotFound ||
        [[self country] rangeOfString: str
            options: NSCaseInsensitiveSearch].location != NSNotFound ||
        [[self phone] rangeOfString: str
            options: NSCaseInsensitiveSearch].location != NSNotFound ||
        [[self email] rangeOfString: str
            options: NSCaseInsensitiveSearch].location != NSNotFound ||
        [[self zip] rangeOfString: str
            options: NSCaseInsensitiveSearch].location != NSNotFound)
    {
        return YES;
    }
    else {
        return NO;
    }
}

- (NSComparisonResult) compareNames: (id) element
{
    // Compare by last names
    return [lname compare: [element lname]];
}

- (void) print
{
    // Concatenate fullname and address fields to make them easier to print
    NSMutableString *fullName = [[NSMutableString alloc] init];
    [fullName appendString: fname];
    [fullName appendString: @" "];
    [fullName appendString: lname];

    NSMutableString *address = [[NSMutableString alloc] init];
    [address appendString: city];
    [address appendString: @", "];
    [address appendString: state];
    [address appendString: @", "];
    [address appendString: zip];

    NSLog(@"=======================================");
    NSLog(@"|**                                 **|");
    NSLog(@"| %-35s |", [fullName UTF8String]);
    NSLog(@"|                                     |");
    NSLog(@"| %-35s |", [address UTF8String]);
    NSLog(@"| %-35s |", [country UTF8String]);
    NSLog(@"| Phone: %-29s|", [phone UTF8String]);
    NSLog(@"| Email: %-29s|", [email UTF8String]);
    NSLog(@"|                                     |");
    NSLog(@"|        O       <^>        O         |");
    NSLog(@"=======================================");
}
@end
