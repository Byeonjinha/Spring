def solution(n, m, x_axis, y_axis):
    x_list=[]
    y_list=[]
    x_length = 0;

    for i in range(len(x_axis)):
        if i == 0:
            x_list.append(x_axis[i])
        elif i > 0 :
            x_length=x_axis[i]-x_axis[i-1]
            x_list.append(x_length)
    x_list.append(n-x_axis[-1])


    for j in range(len(y_axis)):
        if j ==0:
            y_list.append(y_axis[j])
        elif j>0 :
            y_length=y_axis[j]-y_axis[j-1]
            y_list.append(y_length)
    y_list.append(m-y_axis[-1])
    print(x_list,y_list)
    max_1 = 0

    print(x_list,y_list)
    for i2 in range(len(x_list)):
        for j2 in range(len(y_list)):
            print(x_list[i2] , y_list[j2])
            if x_list[i2]*y_list[j2] > max_1:
                max_1 = x_list[i2]*y_list[j2]
    answer = max_1
    return answer

n=3
m=4
x_axis=[2]
y_axis=[1,2]
solution(n, m, x_axis, y_axis)