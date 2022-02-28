def solution(arr):
    answer = []
    dic_1 = {}
    for i in range(len(arr)):
        dic_1[arr[i]] = 0
        print(dic_1)

    for i in range(len(arr)):
        dic_1[arr[i]] +=1
        print(dic_1)


    for i in dic_1:
        print(i)
        if dic_1.get(i) ==1:
            answer.append(i)
            print(answer)


    if len(answer)==0:
        return [-1]

    return sorted(answer)

arr = [2,1,3,3]
solution(arr)