def solution(n, recipes, orders):
    fire = [0]*n
    recipesdic={}
    orderslist=[]
    for i in recipes:
        recipesdic[i.split(" ")[0]]=i.split(" ")[1]
    print(recipesdic)
    for i2 in orders:
        orderslist.append([i2.split(" ")[0],i2.split(" ")[1]])
    print(orderslist)

    

    answer = 0
    return answer
n = 2
recipes = ["A 3","B 2"]
orders = ["A 1","A 2","B 3","B 4"]
result = 7

solution(n, recipes, orders)