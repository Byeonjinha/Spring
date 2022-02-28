import math
def solution(time, gold, upgrade):

    money_list=[]
    for i in range(len(upgrade)+1):
        money = 0
        tmp_time = time
        for i2 in range(i,0,-1):
            print(i2,"????????")
            if i2 == 1:
                money+=gold*(tmp_time//upgrade[i-1][1])
                print(gold*(tmp_time//upgrade[i-1][1]))
                money_list.append(money)
            else:
                tmp_time-= upgrade[i-i2][1]*math.ceil(upgrade[i-i2+1][0]/gold)
                money+=(math.ceil(upgrade[i-i2+1][0]/gold)*gold-upgrade[i-i2+1][0])

    print(money_list ,"moneylist")
    answer = max(money_list)
    return answer
time=11
gold =1000
upgrade = 	[[0, 5], [100, 4], [200, 3]]
solution(time, gold, upgrade)