import math
import random
def sum_1 (a, b):
    a, b = math.ceil(a), int(b)
    answer=0
    it = iter(range(a,b+1))
    for i in range(a,b+1):
        answer+=it.__next__()
    print(answer)
    return answer
def product_1 (a, b):
    a,b=math.ceil(a),int(b)
    answer=1
    it = iter(range(a,b+1))
    for i in range(a,b+1):
        answer*=it.__next__()
    print(answer)
    return answer

def randSum(n):
    sum_N = sum(random.sample(range(100), n))
    print(sum_N)
    return sum_N
def randProduct(n):
    product_N = 1
    list_1 = random.sample(range(100), n)
    for i in list_1:
        product_N*=i
    print(product_N)
    return product_N
a,b = 3.1,5.7
sum_1(a, b)
product_1(a, b)

n=5
randSum(n)
randProduct(n)
