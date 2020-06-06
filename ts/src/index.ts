function pushNum(array: Array<string | number>): void {
    array.push(1);
}

const arr: Array<string> = ["a", "b", "c"];
pushNum(arr);

// logs [ "a", "b", "c", 1 ]
console.log(arr);
