def solution(n,p,c):
    sum=0
    yochung=0
    zego=0
    danga= 100
    count=0
    for i in range(n):
        zego+=p[i]
        yochung= zego-c[i]
        if yochung >=0:
            zego-=c[i]
            sum+=c[i]*danga
            count=0
            danga=100
        elif yochung < 0:
            if count==0:
                count+=1
                danga=50
            elif count==1:
                count+=1
                danga=25
            elif count >=2 :
                return sum
    answer = sum/n
    print(answer)
    return answer


n = 6
p=[5,4,7,2,0,6]
c = [4,6,4,9,2,3]
solution(n,p,c)