//
//  FISCaesarCipher.m
//  CaesarCipher
//
//  Created by Chris Gonzales on 5/29/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISCaesarCipher.h"
#import <objc/objc-runtime.h>

@implementation FISCaesarCipher

//    decoding is encoding-backwards:
-(NSString *)decodeWithMessage:(NSString *)encodedMessage andOffset:(NSInteger)key {
    return [self encodeWithMessage:encodedMessage andOffset:(-1* key)];
}

//encoding is ecnoding:
-(NSString*)encodeWithMessage:(NSString*)message andOffset:(NSInteger)key {
    NSCharacterSet *charsToEncode = [NSCharacterSet letterCharacterSet];
    NSCharacterSet *upperCaseLetters = [NSCharacterSet uppercaseLetterCharacterSet];
    NSCharacterSet *lowerCaseLetters = [NSCharacterSet lowercaseLetterCharacterSet];

   
    //All multiples of 26 come "full-circle" around the alphabet. We get rid of them to simplify the problem.
    NSInteger modKey = key % 26;
    

    NSMutableArray *workingMessage = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < message.length; i++) {
        NSInteger workingASCIIChar = [message characterAtIndex:i];

        if ([charsToEncode characterIsMember: workingASCIIChar]) {
            BOOL isUppercase = [upperCaseLetters characterIsMember: workingASCIIChar] ? YES : NO;
            BOOL isLowercase = !isUppercase;

            workingASCIIChar += modKey; //the actual encoding
            
    //        word-wrapping (e.g., z + 3 --> c)
            if ((isUppercase && workingASCIIChar > 90) ||
                (isLowercase && workingASCIIChar > 122))
                    workingASCIIChar -= 26;
            else if ((isUppercase && workingASCIIChar < 65) ||
                     (isLowercase && workingASCIIChar < 97))
                    workingASCIIChar += 26;
        }
        
        [workingMessage addObject:[[NSString stringWithFormat:@"%C", (unichar)workingASCIIChar]mutableCopy]];
    } //closes for-loop
    
    NSLog(@"%@", [[workingMessage class] description]);
    NSLog(@"%@", [[workingMessage[0] class] description]);
    
    return [workingMessage componentsJoinedByString:@""];
}



@end
