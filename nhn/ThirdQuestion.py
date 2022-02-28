from math import gcd, sqrt  #math.gcd - 최대공약수, 제곱근을 구하는 함수
from random import randint # 정수 난수 생성 함수
def monte_carlo( n_trials, binary_sampler ):
 print(binary_sampler())
 return sum(
# To do: Code here

  ([1,2,3,4,5,6,83452345])) / n_trials

def dirichlet_test():  # 3 -> 디리클레 판정법 함수 실행, 정수난수의 최대공약수가 1이면 True 를 리턴
 return gcd( randint(1, 1000), randint(1, 1000) ) == 1

def quess_pi( n_trials ):  # 2 -> 10만 케이스  제곱근(6/ monte_carlo 함수 (10만, dirichlet_test ))  ->디리클레함수 실행
 print(monte_carlo( n_trials, dirichlet_test ),"asdfasdf")
 return sqrt( 6 / monte_carlo( n_trials, dirichlet_test ) )
print( quess_pi( 100_000 ))  #  1.->       10만 케이스 실행


