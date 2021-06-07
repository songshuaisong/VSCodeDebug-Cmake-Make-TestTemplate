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
    int c = 0;

    c = add(a, b);
    printf("a + b = %d\n", c);
    c = sub(a, b);
    printf("a - b = %d\n", c);
    c = mul(a, b);
    printf("a * b = %d\n", c);
    c = dev(a, b);
    printf("a / b = %d\n", c);

#ifdef linux
    funCmt.keyboard();
    funCmt.fuckYouBug();
    funCmt.fuckYouBeauty();
    funCmt.GodBeastBless();
    funCmt.theFuckSourceCode();
    funCmt.TheLittleGirl();
    funCmt.weWantFuckYou();
    funCmt.humanSkeleton();
#endif
    /**
     * 在windows环境下
     * _WIN32：为编译器内置的宏，对32和64位程序有效。
     * _WIN64：与_WIN32类似，只是对64位程序有效。
     * _MSC_VER，为vc版本的内置宏
    **/
#ifdef _MSC_VER
    printf("Please press any key to continue...");
    getchar();
#endif

    return 0;
}
