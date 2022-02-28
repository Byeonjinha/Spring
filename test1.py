def solution(n, left, right):
    answer = []

    for i in range(0, n+1):
        for j in range(1,i+1):
            print(i,j,divmod(i, j+1))
    print(answer)
    return answer

