void setup(){
    int[] list1 = {1,2,3,5,4};
    println("contains: "+contains(list1, 1));
    println("min_max: "+min_max(list1));
    exit();
}

boolean contains (int[] arr, int val){
    for (int i = 0; i < arr.length; i++){
        if (arr[i] == val){
            return true;
        }
    }
    return false;
}

boolean min_max(int[] arr){
    int min = arr[0];
    int max = arr[0];
    boolean contains = true;
    for (int i = 0; i < arr.length; i++){
        if (arr[i] < min){
            min = arr[i];
        }
        if (arr[i] > max){
            max = arr[i];
        }
    }
    for(int i = min; i < max; i++){
        if (!contains(arr, i)){
            return false;
        }
    }
    return contains;
}