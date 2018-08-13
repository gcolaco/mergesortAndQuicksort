import Foundation

var array:[Int] = [3,2,4,6,8,7,5,9,100,94,18,15,16,101,200,1,0,]


func mergeSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else { return array } // Recursion stop case
    
    let mIndex = array.count / 2
    
    //split left side of the array recursively
    let lArray = mergeSort(Array(array[0..<mIndex]))
    
    //split right side of the array recursively
    let rArray = mergeSort(Array(array[mIndex..<array.count]))
    
    // sort and merge the arrays together
    return merge(lSide: lArray, rSide: rArray)
}

func merge(lSide: [Int], rSide: [Int]) -> [Int] {
    var lIndex = 0, rIndex = 0
    
    // ordered array that will be merged in
    var mergedArray = [Int]()
    
    // compares left array elements with right array elements and order them into the array
    while lIndex < lSide.count && rIndex < rSide.count {
        if lSide[lIndex] < rSide[rIndex] {
            mergedArray.append(lSide[lIndex])
            lIndex += 1
            
        } else if lSide[lIndex] > rSide[rIndex] {
            mergedArray.append(rSide[rIndex])
            rIndex += 1
            
        } else {
            mergedArray.append(lSide[lIndex])
            lIndex += 1
            mergedArray.append(rSide[rIndex])
            rIndex += 1
        }
    }
    
    // adding the rest of the elements that dont need comparison into the merged array
    while lIndex < lSide.count {
        mergedArray.append(lSide[lIndex])
        lIndex += 1
    }
    
    while rIndex < rSide.count {
        mergedArray.append(rSide[rIndex])
        rIndex += 1
    }
    
    return mergedArray
}


/*
 ===================================================================
 ===================================================================
 ======================== QUICK SORT ===============================
 ===================================================================
 ===================================================================
 */

func quicksort( arr: inout [Int], left: Int, right: Int) {
    if left < right {
        //partition instanciated so we can use the pivot to sort the left and right side
        let p = partition(arr: &arr, left: left, right: right)
        
        //sort left side
        quicksort(arr: &arr, left: left, right: p - 1)
        
        //sort right side
        quicksort(arr: &arr, left: p + 1, right: right)
    }
}

func partition( arr: inout [Int], left: Int, right: Int) -> Int {
    let pivotValue = arr[right] //pivot here is the last element of the array
    var storeIndex = left
    
    //swaps the element with the storeIndex in case it is smalle then the pivot value
    for i in left..<right {
        if arr[i] < pivotValue {
            swap(arr: &arr, a: i, b: storeIndex)
            storeIndex += 1
        }
    }
    //after done all the swaps, we swap the right element(pivot) with the last stored element
    swap(arr: &arr, a: storeIndex, b: right)
    return storeIndex
}

func swap( arr: inout [Int], a: Int, b: Int) {
    let temp = arr[a]
    arr[a] = arr[b]
    arr[b] = temp
}



/*
 ===================================================================
 ===================================================================
 =================== TESTING MERGE & QUICK =========================
 ===================================================================
 ===================================================================
 */

var merge = mergeSort(array)
print(merge)

print("==========================")

var test = [1, 8, 11, 100, 0, 6, 10, 12, 13, 101, 54, 7, 3, 2, 5, 4, 88]
quicksort(arr: &test, left: 0, right: test.count-1)
print(test)

