// Interface file for AddressBook
// Chapter 15 exercises 2, 3, 4, 5 and 6.
#import <Foundation/Foundation.h>
#import "AddressCard.h"

@interface AddressBook : NSObject <NSCoding, NSCopying>

@property (nonatomic, copy) NSString *bookName;
@property (nonatomic, strong) NSMutableArray *book;

/**
 * Initializes the AddressBook with a name.
 * @param name the name of the AddressBook
 */
- (id) initWithName: (NSString *) name;

/**
 * Adds a AddressCard to the AddressBook
 * @param theCard the AddressCard to add
 */
- (void) addCard: (AddressCard *) theCard;

/**
 * Removes an AddressCard from the AddressBook
 * @param theCard the AddressCard to remove
 */
- (void) removeCard: (AddressCard *) theCard;

/**
 * Counts the number of entries in the AddressBook
 * @return the number of entries in the AddressBook
 */
- (NSUInteger) entries;

/**
 * Lookup address card by name -- also does partial matches.
 * @param theName the name of the person to search
 * @return an array of cards that partially or fully matches theName
 */
- (NSMutableArray *) lookup: (NSString *) theName;

/**
 * Removes an entry from the AddressBook
 * @param theName the entry with this name to remove
 * @return YES if it finds and removes an entry. NO if multiple matches
 * are found or if no matches are found
 */
- (BOOL) removeName: (NSString *) theName;

/**
 * Sorts the address book using a NSComparator block.
 */
- (void) sort;

/**
 * List the entries in the AddressBook
 */
- (void) list;

// To conform to the NSCopying protocol
- (id)copyWithZone:(NSZone *)zone;

// Conforms to NSCoding protocol used for archiving the addressbook and cards
- (void)encodeWithCoder:(NSCoder *)encoder;
- (id)initWithCoder:(NSCoder *)decoder;
@end
