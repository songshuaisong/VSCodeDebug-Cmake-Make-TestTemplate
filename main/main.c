#include "../add/add.h"
#include "../dev/dev.h"
#include "../inc/pattern.h"
#include "../mul/mul.h"
#include "../sub/sub.h"
#include "stdio.h"

// 聲明外部變量
extern TfunlyCmt funCmt;
int main(int argc, const char **argv)
{
    int a = 10, b = 2;

    printf("a + b = %d\r\n", add(a, b));
    printf("a - b = %d\r\n", sub(a, b));
    printf("a * b = %d\r\n", mul(a, b));
    printf("a / b = %d\r\n", dev(a, b));

    funCmt.keyboard();
    funCmt.fuckYouBug();
    funCmt.fuckYouBeauty();
    funCmt.GodBeastBless();
    funCmt.theFuckSourceCode();
    funCmt.TheLittleGirl();
    funCmt.weWantFuckYou();
    funCmt.humanSkeleton();

    printf("Please press any key to continue...");
    // getchar();

    return 0;
}
