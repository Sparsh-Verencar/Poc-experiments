#include <stdio.h>
#include <string.h>
#include <stdlib.h>
int main() {
    char stack[100], ip[100], opt[10][10][2], ter[10];
    int i, j, k, n, top = 0, col, row;
    for(i = 0; i < 100; i++) {
        stack[i] = '\0'; 
        ip[i] = '\0';
    }
    for(i = 0; i < 10; i++) {
        for(j = 0; j < 10; j++) {
            opt[i][j][0] = '\0';
        }
    }
    printf("Enter the no.of terminals: ");
    if (scanf("%d", &n) != 1) return 1;
    printf("Enter the terminals: ");
    scanf("%s", ter);
    printf("\nEnter the table values:\n");
    for(i = 0; i < n; i++) {
        for(j = 0; j < n; j++) {
            printf("Enter the value for %c %c: ", ter[i], ter[j]);
            scanf("%s", opt[i][j]);
        }
    }
    printf("\nOPERATOR PRECEDENCE TABLE:\n");
    for(i = 0; i < n; i++) {
        printf("\t%c", ter[i]);
    }
    printf("\n");
    for(i = 0; i < n; i++) {
        printf("%c", ter[i]);
        for(j = 0; j < n; j++) {
            printf("\t%c", opt[i][j][0]);
        }
        printf("\n");
    }
    stack[top] = '$';
    printf("\nEnter the input string: ");
    scanf("%s", ip);
    i = 0;
    printf("\n%-20s %-20s %-20s\n", "STACK", "INPUT STRING", "ACTION");
    while(i <= strlen(ip)) {
        col = -1; row = -1;
        for(k = 0; k < n; k++) {
            if(stack[top] == ter[k]) col = k;
            if(ip[i] == ter[k]) row = k;
        }
        if((stack[top] == '$') && (ip[i] == '$')) {
            printf("%-20s %-20s %-20s\n", stack, ip + i, "String is accepted");
            break;
        } 
        else if(col != -1 && row != -1 && (opt[col][row][0] == '<' || opt[col][row][0] == '=')) {
            printf("%-20s %-20s Shift %c\n", stack, ip + i, ip[i]);
            stack[++top] = opt[col][row][0];
            stack[++top] = ip[i];
            i++;
        } 
        else if(col != -1 && row != -1 && opt[col][row][0] == '>') {
            printf("%-20s %-20s %-20s\n", stack, ip + i, "Reduce");
            while(stack[top] != '<') {
                stack[top--] = '\0'; 
            }
            stack[top--] = '\0'; 
        } 
        else {
            printf("\nString is not accepted\n");
            break;
        }
    }
    return 0;
}


