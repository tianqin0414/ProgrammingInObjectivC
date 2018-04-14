// Interface file for AddressCard
// Chapter 15 exercises 2, 3, 4, 5 and 6.
#import <Foundation/Foundation.h>

@interface AddressCard : NSObject <NSCoding, NSCopying>

@property (copy, nonatomic) NSString *fname, *lname, *email, *state, *city;
@property (copy, nonatomic) NSString *zip, *country, *phone;

/**
 * Set both name and email
 */
- (void) setFName: (NSString *) first andLName: (NSString *) last
    andEmail: (NSString*) theEmail;

/**
 * Sets a bunch of address card fields including the Person's first and
 * last names, email and where they live, including their phone number.
 */
- (void) setFName: (NSString *) first andLName: (NSString *) last
    andEmail: (NSString *) theEmail andState: (NSString *) State
    andCity: (NSString *) City andZip: (NSString *) Zip
    andCountry: (NSString *) Country andPhone: (NSString *) pnumber;

/**
 * Searches for a match for the indicated string on an address card.
 * @return YES if it finds a match, otherwise returns NO.
 */
- (BOOL) lookupCardForString: (NSString* ) str;

/**
 * Tests if two AddressCards are the same
 * @param theCard the address card to compare
 * @return true if they are equal, false if they are not.
 */
- (BOOL) isEqual: (AddressCard *) theCard;

/**
 * Compares the two names from the specified address cards.
 * @param element the element to compare with
 * @return NSOrderedAscending, NSOrderedSame or NSOrderedDecending depending
 * on the comparison.
 */
- (NSComparisonResult) compareNames: (id) element;

/**
 * Prints the AddressCard in a fancy format.
 */
- (void) print;

// To conform to the NSCopying protocol
- (id) copyWithZone:(NSZone *)zone;

// Conforms to NSCoding protocol used for archiving the addressbook and cards
- (void)encodeWithCoder:(NSCoder *)encoder;
- (id)initWithCoder:(NSCoder *)decoder;
@end
