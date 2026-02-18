%{
#include <stdio.h>
int vowel_counter = 0;
int consonant_counter = 0;
%}
%%
[aeiouAEIOU] {vowel_counter++;}
[^aeiouAEIOU \n] {consonant_counter++;} //\n,space added to not count spaces as consonant
<<EOF>> {
    printf("Vowels found:%d\n", vowel_counter);
    printf("Consonants found:%d\n", consonant_counter);
    return 0;
}
%%
int yywrap() {
    return 1;
}//end of file stuff
int main()
{
    yylex();
    return 0;
}
