#import <Cocoa/Cocoa.h>

void NoPrefixLog (NSString *format, ...) {
    if (format == nil) {
        printf("nil\n");
        return;
    }
    // Get a reference to the arguments that follow the format parameter
    va_list argList;
    va_start(argList, format);
    // Perform format string argument substitution, reinstate %% escapes, then print
    NSString *s = [[NSString alloc] initWithFormat:format arguments:argList];
    printf("%s\n", [[s stringByReplacingOccurrencesOfString:@"%%" withString:@"%%%%"] UTF8String]);
    va_end(argList);
}

int main(int argc, char *argv[])
{
    return NSApplicationMain(argc, (const char **)argv);
}
