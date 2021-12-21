def solution(drum):
    count=0
    for i in range(len(drum)):
        location=0
        star = 0

        while True:
            if drum[location][i] == '#':
                location+=1
                if location == len(drum):
                    count+=1
                    break
            elif drum[location][i] == '>':
                i+=1
            elif drum[location][i] == '<':
                i-=1
            elif drum[location][i] == '*' and star == 0:
                location+=1
                star+=1
                if location == len(drum):
                    count+=1
                    break
            elif drum[location][i] == '*' and star ==1:
                break;

    answer= count
    return answer
drum =["######",">#*###","####*#","#<#>>#",">#*#*<","######"]
solution(drum)