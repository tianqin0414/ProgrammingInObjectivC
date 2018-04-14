// ex3.m -- Outputs the contents that are in one of the plists stored in
// /Library/Preferences/
#import <Foundation/Foundation.h>

int main(int argc, char *argv[])
{
    @autoreleasepool {
        NSDictionary *updateDict;

        updateDict = [NSDictionary dictionaryWithContentsOfFile:
                      @"/Library/Preferences/com.apple.SoftwareUpdate.plist"];

        if (!updateDict)
            NSLog(@"Reading of plist failed!");

        for (NSString *key in updateDict) {
            NSLog(@"%@: %@", key, [updateDict objectForKey:key]);
        }
    }

    return 0;
}
