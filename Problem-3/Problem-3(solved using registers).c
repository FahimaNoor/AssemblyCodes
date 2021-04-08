main(){
int array[]={6,3,1,4,0,8,9,2,7,5};
int even[5];
int odd[5];

int i=0,even_index=0,odd_index=0;

while(i<10){
    if(i%2==0){
        even[even_index]=array[i];
        even_index++;

    }
    else{
        odd[odd_index]=array[i];
        odd_index++;
    }
    i++;
}

i=0;
printf("Array: \n");
    while(i<10){
        printf("%d  ",array[i]);
        i++;
    }

even_index=0;


///start of checking whether code is correct or not
    printf("\nEven: \n");
        while(even_index<5){
            printf("%d  ",even[even_index]);
            even_index++;
        }

    odd_index=0;
    printf("\nOdd: \n");
        while(odd_index<5){
            printf("%d  ",odd[odd_index]);
            odd_index++;
        }
///end of checking whether code is correct or not



}
