def solution(office, r, c,move):
    direction = 0
    dx = [-1, 1, 0, 0]  #
    dy = [0,  0,-1, 1]  # 상하좌우를 담아줌
    sum_1 = 0
    sum_1 += office[r][c]
    office[r][c] = 0
    x = c
    y = r  # x,y  좌표 담아줌
    n = len(office)  # 전체 지도 크기  y =  높     이가  6
    m = len(office[0])  # x = 너비 10
    for i in range(len(move)):
        print(direction,"direction",x,y)
        if move[i] == "left":
            direction = (direction+3)%4
        elif move[i] == "right":
            direction = (direction+1)%4
        elif move[i] == "go":
            if direction == 0:
                nx = x + dx[2]  # 0일 때 왼쪽으로, 1일 때 오른쪽, 2일 때 아래로 한 칸, 3일 때 위로 한 칸
                ny = y + dy[2]
                if nx >= n or ny >= m or nx < 0 or ny < 0:  # 좌표 범위를 넘어가면 무시때림
                    continue
                if office[ny][nx] == -1:  # -1로 갈 때 막힘
                    continue
                else:  # 장애물이 있을 경우
                    sum_1+=office[ny][nx]
                    office[ny][nx] = 0
                    x = nx
                    y = ny
            elif direction == 1:
                nx = x + dx[1]  # 0일 때 왼쪽으로, 1일 때 오른쪽, 2일 때 아래로 한 칸, 3일 때 위로 한 칸
                ny = y + dy[1]

                if nx >= n or ny >= m or nx < 0 or ny < 0:  # 좌표 범위를 넘어가면 무시때림
                    continue
                if office[ny][nx] == -1:  # -1로 갈 때 막힘
                    continue
                else:
                    sum_1 += office[ny][nx]
                    office[ny][nx] = 0
                    x = nx
                    y = ny
            elif direction == 2:
                nx = x + dx[3]  # 0일 때 왼쪽으로, 1일 때 오른쪽, 2일 때 아래로 한 칸, 3일 때 위로 한 칸
                ny = y + dy[3]
                if nx >= n or ny >= m or nx < 0 or ny < 0:  # 좌표 범위를 넘어가면 무시때림
                    continue
                if office[ny][nx] == -1:  # -1로 갈 때 막힘
                    continue
                else:
                    sum_1 += office[ny][nx]
                    office[ny][nx] = 0
                    x = nx
                    y = ny
            elif direction == 3:
                nx = x + dx[0]  # 0일 때 왼쪽으로, 1일 때 오른쪽, 2일 때 아래로 한 칸, 3일 때 위로 한 칸
                ny = y + dy[0]
                print(nx,ny,"nx","ny",office[ny][nx])
                if nx >= n or ny >= m or nx < 0 or ny < 0:  # 좌표 범위를 넘어가면 무시때림
                    continue
                if office[ny][nx] == -1:  # -1로 갈 때 막힘
                    continue
                else:
                    sum_1 += office[ny][nx]
                    office[ny][nx] = 0
                    x = nx
                    y = ny
                    print(x,y,"x","y")
    print(sum_1,"sum_1")
    return sum_1
office = [[5,-1,4], [6,3,-1],[2,-1,1]]  # map
table = []
r = 1 #좌표
c = 0
move = ["go","go","right","go","right","go","left","go","right","right","go","left","go"]
# 보드
# 5  -1  4
# 6  3  -1
# 2  -1  1
# 자원을 부수는 데 드는 비용
solution(office, r2, c2,move)

#뱅크만..